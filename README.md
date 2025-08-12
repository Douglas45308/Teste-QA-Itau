# Teste-QA-itau

Este projeto automatiza testes de preenchimento de formulário no site [Tools QA](https://demoqa.com/automation-practice-form) utilizando Robot Framework e SeleniumLibrary.

## Pré-requisitos

- **Python 3.8+** instalado ([Download Python](https://www.python.org/downloads/))
- **pip** (gerenciador de pacotes do Python)
- **Google Chrome** ou outro navegador compatível
- **ChromeDriver** (ou driver do navegador correspondente) disponível no PATH
- **VS Code** (opcional, recomendado para desenvolvimento)
- **Extensão Robot Framework Language Server** no VS Code (opcional)

## Instalação

1. **Clone o repositório:**
   ```sh
   git clone https://github.com/seu-usuario/Teste-QA-itau.git
   cd Teste-QA-itau
   ```

2. **Crie e ative um ambiente virtual (opcional, mas recomendado):**
   ```sh
   python -m venv .venv
   # No Windows:
   .venv\Scripts\activate
   # No Linux/Mac:
   source .venv/bin/activate
   ```

3. **Instale as dependências:**
   ```sh
   pip install -r requirements.txt
   ```
   > Caso não exista um arquivo `requirements.txt`, instale manualmente:
   ```sh
   pip install robotframework selenium robotframework-seleniumlibrary robotframework-faker
   ```

4. **Baixe o ChromeDriver** compatível com sua versão do Chrome e coloque-o no PATH, ou ajuste o caminho no projeto.

## Estrutura do Projeto

- `features/` — arquivos de cenários de teste (Gherkin/Robot)
- `steps/` — arquivos com os passos dos testes
- `pages/` — arquivos com as keywords de interação com a página
- `prints/` — capturas de tela geradas durante os testes
- `.gitignore` — arquivos e pastas ignorados pelo Git

## Como Executar os Testes

### Via Linha de Comando

Execute o comando abaixo na raiz do projeto:

```sh
robot demo-tools-qa/features/PreenchimentoFormulario.robot
```

Os relatórios serão gerados na raiz do projeto (`log.html`, `report.html`, `output.xml`).

### Via VS Code

1. Abra a pasta do projeto no VS Code.
2. Instale a extensão **Robot Framework Language Server**.
3. Abra o arquivo de teste desejado (ex: `PreenchimentoFormulario.robot`).
4. Clique no botão de execução (Run Test) exibido acima do cenário ou use o comando `Robot: Run Suite/Test` no Command Palette (`Ctrl+Shift+P`).

## Observações

- As capturas de tela dos testes são salvas na pasta `prints/`.
- Certifique-se de que o driver do navegador está atualizado e compatível com a versão do navegador instalado.
- Para customizar variáveis, edite o arquivo `Config/base.robot`.

---

**Dúvidas ou sugestões?**  
Abra uma issue ou entre em contato com o responsável pelo repositório.