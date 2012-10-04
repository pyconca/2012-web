"""Create and send messages to users
"""
import logging
import os
import smtplib

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from pyramid.settings import asbool


LOG = logging.getLogger(__name__)
# notification statuses
# might have pending, sent, failed
MSG_STATUS = {
    'pending': 0,
    'sent': 1,
    'failed': 2,
    'not_sent': 3,
    'error': 4,
}


def sendmail(to, from_addr, subject, body):
    sendmail_location = "/usr/sbin/sendmail"
    p = os.popen("{0} -t".format(sendmail_location), "w")
    p.write("From: {0}\n".format(from_addr))
    p.write("To: {0}\n".format(to))
    p.write("Subject: {0}\n".format(subject))
    p.write("\n")  # blank line separating headers from body
    p.write(body)
    status = p.close()
    if status != 0:
        LOG.debug("SENDMAIL FAIL: " + str(status))
        return False
    else:
        return True


class Message(object):
    """This is a base email message we can then tweak"""

    def __init__(self, to, subject, settings):
        """Start up a basic message"""
        self.to = to
        self.subject = subject
        self.settings = settings

        self.from_addr = settings.get('email.from', None)

        # need ot setup/override in the extending classes
        self.message_file = None

    def _get_message_body(self, template_file, message_data):
        """Return the completed message template body

        """
        return "Test email message from PyConCA"
        # lookup = config['pylons.app_globals'].mako_lookup
        # template = lookup.get_template(template_file)

        # # template vars are a combo of the obj dict and the extra dict
        # template_vars = {'data': message_data}
        # return template.render(**template_vars)

    def send(self, message_data=None):
        """Send the message with the given subject

        body can be sent as part of send() or it can be set to the object as
        msg.body = "xxx"

        """
        self.body = self._get_message_body(self.message_file, message_data)

        msg = MIMEMultipart('related')
        msg['Subject'] = self.subject
        msg['From'] = self.from_addr
        msg['To'] = self.to

        plain_text = MIMEText(self.body, 'plain', _charset="UTF-8")
        msg.attach(plain_text)

        is_live = asbool(self.settings.get('email.enable', False))

        if not is_live:
            print msg.as_string()
            return MSG_STATUS['sent']
        else:
            try:
                all_emails = msg['To']
                smtp_server = self.settings.get('email.host')

                if smtp_server == 'sendmail':
                    sendmail(msg['To'], msg['From'], msg['Subject'], self.body)
                else:
                    port = int(self.settings.get('email.port', 25))
                    mail_server = smtplib.SMTP(smtp_server, port)
                    mail_server.sendmail(msg['From'],
                                    all_emails,
                                    msg.as_string())
                    mail_server.quit()
                return MSG_STATUS['sent']

            except smtplib.SMTPException:
                LOG.error("SMTP Error sending notice for: {0} ".format(
                            str(msg)))
                return MSG_STATUS['error']


class ReactivateMsg(Message):
    """Send an email for a reactivation email"""

    def _get_message_body(self, template_file, message_data):
        """Return the completed message template body

        """
        return """
            Reactivate your PyConCA account with the following url:

            {0}

            ---
            PyCon.ca""".format(message_data)
        # lookup = config['pylons.app_globals'].mako_lookup
        # template = lookup.get_template(template_file)

        # # template vars are a combo of the obj dict and the extra dict
        # template_vars = {'data': message_data}
        # return template.render(**template_vars)
