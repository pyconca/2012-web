from mako import lexer, parsetree
from mako.ext.babelplugin import extract_nodes as extract_mako_nodes


def extract_nodes(nodes, keywords, comment_tags, options):
    for node in nodes:
        child_nodes = None

        if isinstance(node, parsetree.BlockTag):
            child_nodes = node.nodes

            if len(node.nodes) \
                    and isinstance(node.nodes[0], parsetree.Text) \
                    and "filter" in node.attributes \
                    and "gettext" in node.attributes["filter"]:
                false_positives = [n.content for n in node.nodes[1:]
                                   if hasattr(n, 'content')
                                   and n.content.strip()[:2] in ('%s', '%d')]
                if len(node.nodes) - len(false_positives) == 1:
                    child_nodes = None
                    yield (node.lineno, None,
                           node.nodes[0].content +
                           ''.join(false_positives), [])

        if child_nodes:
            for extracted in extract_nodes(child_nodes, keywords, comment_tags,
                                           options):
                yield extracted


def extract(fileobj, keywords, comment_tags, options):
    """Extract messages from plain Mako defs and from Python
    expressions inside Mako templates.
    """
    encoding = "utf-8"
    template_node = lexer.Lexer(fileobj.read(),
                                input_encoding=encoding).parse()

    for extracted in extract_nodes(template_node.get_children(),
                                   keywords, comment_tags, options):
        yield extracted


    # proceed with the standard Mako extractor
    for extracted in extract_mako_nodes(template_node.get_children(),
                                        keywords, comment_tags, options):
        yield extracted
