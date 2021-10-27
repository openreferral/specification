

def insert_style_rule_to_svg(filename, style):

    with open(filename) as fp:
        data = fp.read()

    with open(filename, "w") as fp:
        for line in data.split('\n'):
            fp.write(line + '\n')
            if line.startswith('<title>'):
                fp.write('<style>'+style+'</style>')

