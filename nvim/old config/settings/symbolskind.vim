let g:completion_customize_lsp_label = {
                \ 'method' : '  ',
                \ 'function': '  ',
                \ 'variable': '[]',
                \ 'field': '  ',
                \ 'typeParameter': '<>',
                \ 'constant': '  ',
                \ 'class': ' פּ ',
                \ 'interface': ' 蘒',
                \ 'struct': ' ',
                \ 'event': '  ',
                \ 'operator': '  ',
                \ 'module': '  ',
                \ 'property': '  ',
                \ 'enum': ' 練',
                \ 'reference': '  ',
                \ 'keyword': '  ',
                \ 'file': '  ',
                \ 'folder': ' ﱮ ',
                \ 'color': '  ',
                \ 'unit': ' 塞 ',
                \ 'snippet': '  ',
                \ 'text': '  ',
                \ 'constructor"': '  ',
                \ 'value': '  ',
                \ 'enumMember': '  '
                \}

"call coc#config("suggest.completionItemKindLabels", {
"      \   "keyword": "\uf767",
"      \   "variable": "\ue79b",
"      \   "value": "\uf89f",
"      \   "operator": "\uf694",
"      \   "function": "\ue79b",
"      \   "reference": "\uf481",
"      \   "constant": "\uf6fc",
"      \   "method": "\ue79b",
"      \   "struct": "\uf1b3",
"      \   "class": "\ufb44",
"      \   "interface": "\ufa20",
"      \   "text": "\uf52b",
"      \   "enum": "\ufa57",
"      \   "enumMember": "\uf15d",
"      \   "module": "\uf668",
"      \   "color": "\ue22b",
"      \   "property": "\uf0ad",
"      \   "field": "\ue716",
"      \   "unit": "\uf69c",
"      \   "event": "\uf0e7",
"      \   "file": "\uf15b",
"      \   "folder": "\ufc5e",
"      \   "snippet": "\uf5cf",
"      \   "typeParameter": "\uf728",
"      \   "default": "\uf29c",
"      \   "constructor": "\ue20f"
"      \ })

"call coc#config("suggest.completionItemKindLabels", {
"      \   "keyword": "\uf1de",
"      \     "variable": "\ue79b",
"      \     "value": "\uf89f",
"      \     "operator": "\u03a8",
"      \     "function": "\u0192",
"      \     "reference": "\ufa46",
"      \     "constant": "\uf8fe",
"      \     "method": "\uf09a",
"      \     "struct": "\ufb44",
"      \     "class": "\uf0e8",
"      \     "interface": "\uf417",
"      \     "text": "\ue612",
"      \     "enum": "\uf435",
"      \     "enumMember": "\uf02b",
"      \     "module": "\uf40d",
"      \     "color": "\ue22b",
"      \     "property": "\ue624",
"      \     "field": "\uf9be",
"      \     "unit": "\uf475",
"      \     "event": "\ufacd",
"      \     "file": "\uf723",
"      \     "folder": "\uf114",
"      \     "snippet": "\ue60b",
"      \     "typeParameter": "\uf728",
"      \     "default": "\uf29c"
"      \ })
"  call coc#config('suggest', {
"  \   'completionItemKindLabels': {
"  \     'function'              :  "\uf794",
"  \     'method'                :  "\uf6a6",
"  \     'variable'              :  "\uf71b",
"  \     'constant'              :  "\uf8ff",
"  \     'struct'                :  "\ufb44",
"  \     'class'                 :  "\uf0e8",
"  \     'interface'             :  "\ufa52",
"  \     'text'                  :  "\ue612",
"  \     'enum'                  :  "\uf435",
"  \     'enumMember'            :  "\uf02b",
"  \     'module'                :  "\uf668",
"  \     'color'                 :  "\ue22b",
"  \     'property'              :  "\ufab6",
"  \     'field'                 :  "\uf93d",
"  \     'unit'                  :  "\uf475",
"  \     'file'                  :  "\uf471",
"  \     'value'                 :  "\uf8a3",
"  \     'event'                 :  "\ufacd",
"  \     'folder'                :  "\uf115",
"  \     'keyword'               :  "\uf893",
"  \     'snippet'               :  "\uf64d",
"  \     'operator'              :  "\uf915",
"  \     'reference'             :  "\uf87a",
"  \     'typeParameter'         :  "\uf278",
"  \     'default'               :  "\uf29c"
"  \   }
"  \ })
      "suggest.completionItemKindLabels": {
        "method": "  ",
        "function": "  ",
        "variable": "[]",
        "field": "  ",
        "typeParameter": "<>",
        "constant": "  ",
        "class": " פּ ",
        "interface": " 蘒",
        "struct": "  ",
        "event": "  ",
        "operator": "  ",
        "module": "  ",
        "property": "  ",
        "enum": " 練",
        "reference": "  ",
        "keyword": "  ",
        "file": "  ",
        "folder": " ﱮ ",
        "color": "  ",
        "unit": " 塞 ",
        "snippet": "  ",
        "text": "  ",
        "constructor": "  ",
        "value": "  ",
        "enumMember": "  "
"      },
      "explorer.sources": [
"        {
          "name": "buffer",
          "expand": true
"        },
"        {
          "name": "file",
          "expand": true
"        }
"      ],
      "explorer.keyMappings.global": {
        "<space>": "toggleSelection",
        "L": [
          "expandable?",
"          ["expanded?", "cd", "expand"],
"          ["collapse", "cd"]
"        ]
"      },
      "explorer.presets": {
        "floating": {
          "position": "floating",
          "open-action-strategy": "sourceWindow"
"        }
"      },
      "explorer.icon.enableNerdfont": true,
      "explorer.buffer.tabOnly": true,
      "explorer.file.reveal.whenOpen": false,
      "explorer.file.reveal.filter": {
        "literals": ["node_modules"]
"      },
      "explorer.mouseMode": "singleclick",
      "explorer.debug": true
