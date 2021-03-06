module html

fn test_tag_html() {
	p := tag(name: 'p')
	assert p.html() == '<p></p>'
}

fn test_tag_with_text() {
	h1 := tag(name: 'h1', text: 'Hello')
	assert h1.html() == '<h1>Hello</h1>'
}

fn test_tag_with_attr() {
	div := tag(
		name: 'div'
		attr: {
			'id':    'foo'
			'class': 'bar'
		}
	)
	assert div.html() == '<div id="foo" class="bar"></div>'
}

fn test_tag_with_text_and_attr() {
	div := tag(
		name: 'div'
		attr: {
			'id':    'foo'
			'class': 'bar'
		}
		text: 'This is a div'
	)
	assert div.html() == '<div id="foo" class="bar">This is a div</div>'
}

fn test_block() {
	div := block({
		name: 'div'
		attr: {
			'id':    'foo'
			'class': 'bar'
		}
	}, [
		tag(text: 'This is another div'),
	])
	assert div.html() == '<div id="foo" class="bar">This is another div</div>'
}

fn test_br() {
	brtg := br()
	assert brtg.html() == '<br></br>'
}

fn test_meta() {
	metatg := meta({
		'name':    'referrer'
		'content': 'origin-when-cross-origin'
	})
	assert metatg.html() == '<meta name="referrer" content="origin-when-cross-origin"></meta>'
}

fn test_html() {
	ht := html([
		block({ name: 'head' }, []),
		block({ name: 'body' }, []),
	])
	assert ht.html() == '<!DOCTYPE html><html><head></head><body></body></html>'
}
