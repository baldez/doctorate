Agrupamento de S�ries Temporais de Imagens de Sat�lite
=========

Estou fornecendo uma inst�ncia virtual da minha tese de doutorado: **Agrupamento de S�ries Temporais de Imagens de Sat�lite 
por VNS B�sico com busca local e restri��es**. Realizada no departamento de matem�tica aplicada da
Universidade de Campinas (Unicamp) em parceria com o CePAgri/Unicamp. Todos os c�digos fontes e execut�veis est�o dispon�veis 
sobre a licen�a Gnu General Public License ou Gnu Lesser General Public Licence. As licen�as aplicadas est�o declaradas na 
documenta��o do programa.

Neste reposit�rio voc� encontrar� todos os programas que desenvolvi (em MatLab na sua maioria), arquivos de banco de 
dados (.CSV), mapas mentais, arquivos fontes LaTeX, minha tese (pdf) e todo material que julguei adequado compartilhar. 
Os arquivos foram organizados na seguinte estrutura de pastas:

### 1. LiteratureReference (refer�ncia bibliogr�fica) ###
> Para n�o infringir direitos autorais, os artigos n�o foram disponibilizados. Mas as ferer�ncia em formato *.bib* 
> de todos os artigos, organizados por temas, foram disponibilizados. 

### 2. Programs (programas e scripts) ###
> Todos os programas desenvolvidos na tese.
>

### 3. Data Repository (reposit�rio de dados) ###
> Todos os arquivos de banco de dados usado na constru��o do *benchmarking* do algoritmo. O formato de entrada de 
> dados � normalizado, contando com um arquivo ".csv", contendo todos os dados de forma simples e um meta-arquivo, 
> padr�o ".arf" contendo informa��es do n�meros de inst�ncias, tipo de dados e breve descri��o dos dados. O formato 
> ".arf" foi um formado criado por mim, baseado no cabe�alho do arquivo ".arff", padr�o entrada do programa Weka.
>
> Os arquivos contam com 3 categorias de dados. 
>  1. **Dados sint�ticos:** criados para visualizar em 2D o comportamento dos algoritmos.
>  2. **Dados reais:** extra�dos de reposit�rios virtuais.
>  3. **Dados de s�ries temporais:** dados  reais de s�ries temporais.
 
### 4. Misselanius (Miscel�nea) ###
> A pasta Miscel�nea poderia ser chamada e "outros", ou mesmo "todo o resto". Conta com os arquivos fonte da tese e algumas
> apresenta��es al�m dos arquivos de mapas mentais que desenvolvi no decorrer da tese.