# CrossCode — Atendente Virtual para Academia

> "Treine com método. Evolua com dados."

CrossCode é um assistente virtual (chatbot) que atende alunos e visitantes de uma academia de CrossFit pelo **Telegram**, respondendo perguntas automaticamente, 24 horas por dia.

---

## Qual o objetivo?

É um bot inteligente, consultando informações reais, busca informações e tira dúvidas na base de conhecimento e de banco de dados, de público gerla e de alunos, ajudando a melhorar o fluxo da recepção.

---

## Como ele "pensa" por dentro?

O projeto usa uma técnica chamada **RAG** (Retrieval-Augmented Generation), que numa explicação simples é assim:

> Em vez de a Inteligência Artificial "chutar" uma resposta com base no que ela aprendeu há muito tempo, ela primeiro **busca a informação correta numa fonte confiável** e só depois monta a resposta com base nisso.

No CrossCode, existem duas fontes de informação:

| Base de conhecimento (documento) | Horários, planos, preços, FAQ, contato | Quando quem pergunta ainda não é aluno, ou faz pergunta geral |
| Banco de dados (MySQL) | Cadastro de cada aluno: plano, valor, vencimento, status | Quando quem pergunta já é aluno identificado |

O "cérebro" do bot (o **AI Agent**) decide, sozinho, qual dessas fontes consultar a cada pergunta.

---

## Como foi construído?

O projeto foi feito usando **n8n**, uma ferramenta de automação visual (você monta o fluxo conectando caixinhas, sem precisar programar linha a linha), o fluxo foi ensinado atráves da imersão da Alura com a Oracle.

São dois fluxos principais:

### Fluxo 1 — Ingestão da base de conhecimento
Carrega o documento de conhecimento da academia, transforma o texto em vetores numéricos (*embeddings*) e guarda num banco vetorial, pra poder ser buscado por similaridade de significado depois.

```
Gatilho manual → HTTP Request (busca o .txt no GitHub) → Data Loader → Embeddings (Cohere) → Vector Store
```

### Fluxo 2 — Atendimento via Telegram
Recebe a mensagem do usuário no Telegram, processa com o agente de IA, e responde.

```
Telegram Trigger → AI Agent (Cohere LLM + Memória + Ferramentas) → Send message (Telegram)
```

O AI Agent tem acesso a duas "ferramentas":
- **Simple Vector Store** → busca na base de conhecimento
- **MySQL (Select rows)** → busca dados do aluno, hospedado no [Railway](https://railway.app)

---

## Tecnologias usadas:

- **[n8n]**
- **[Telegram]** — interface de conversa com o usuário (criado via BotFather)
- **[Cohere]** — modelo de linguagem (LLM) e geração de embeddings
- **MySQL** — banco de dados relacional dos alunos
- **[Railway]** — hospedagem em nuvem do banco de dados

---

## Estrutura do repositório:

cross-code/
workflows/              → arquivos .json exportados do n8n (os dois fluxos)
knowledge-base/         → base de conhecimento em texto (horários, planos, FAQ)
database/               → script SQL de criação da tabela de alunos (dados fictícios)
docs/
└── images/             → prints dos fluxos e do bot em funcionamento
README.md

## Sobre os dados:

Este é um **projeto de estudo/portfólio**. A academia "CrossCode", os alunos e os dados de contato usados são **fictícios**, criados apenas para fins de demonstração da arquitetura.

---

## Autora:

Projeto desenvolvido por Paula como estudo de automação com IA, integração de APIs, bancos de dados e arquitetura RAG.
