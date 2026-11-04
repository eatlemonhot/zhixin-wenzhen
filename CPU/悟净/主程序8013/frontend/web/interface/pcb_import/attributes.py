import re


def resolve(values):
    def expand(value, seen=()):
        if value is None:
            return ''
        source = str(value)
        if len(seen) >= 8:
            return ''
        return re.sub(r'=\{([^{}]+)\}',
                      lambda m: '' if m.group(1) in seen else expand(values.get(m.group(1)), seen + (m.group(1),)),
                      source)
    return {str(k): expand(v) for k, v in values.items()}


def merge(*sources):
    output = {}
    for source in sources:
        output.update({k: v for k, v in source.items() if v is not None})
    return resolve(output)
