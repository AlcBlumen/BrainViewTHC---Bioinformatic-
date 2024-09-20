Este repositório contém um código de simulação de dados relacionado à concentração de THC e à ativação dos receptores CB1 e CB2 em diferentes regiões do cérebro. O código também gera um gráfico de dispersão para visualizar a relação entre esses fatores. 
Abaixo está uma explicação detalhada de cada parte do código.

Instalar e Carregar Pacotes Necessários
O código utiliza os pacotes dplyr e ggplot2 para manipulação de dados e visualização gráfica, respectivamente. Caso você não tenha esses pacotes instalados, eles podem ser instalados e carregados com os comandos:
# Instalar e carregar o pacote necessário
install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

Simulação de Dados
Os dados são simulados para representar a concentração de THC e a ativação dos receptores CB1 e CB2 em diferentes regiões do cérebro. Os dados também incluem um valor que indica o efeito neurológico observado. Para garantir a reprodutibilidade, a função set.seed() é usada para gerar os mesmos números aleatórios em cada execução.

r
Copiar código
set.seed(123)  # Para reprodutibilidade
regioes <- c("Córtex Pré-frontal", "Hipocampo", "Amígdala", "Cerebelo", "Núcleo Accumbens")
Um conjunto de dados é criado usando a função data.frame(), onde:

Concentração_THC: Um valor aleatório entre 1 e 10 ng/mg.
Ativacao_CB1: Simula a ativação dos receptores CB1 usando uma distribuição normal com média de 0.5 e desvio padrão de 0.1.
Ativacao_CB2: Simula a ativação dos receptores CB2 com uma distribuição normal, média de 0.3 e desvio padrão de 0.1.
Efeito_Observado: Um valor aleatório entre 0 e 1 representando o efeito neurológico.
r
Copiar código
dados <- data.frame(
  Regiao = rep(regioes, each = 10),
  Concentração_THC = runif(50, min = 1, max = 10),  # Concentração de THC em ng/mg
  Ativacao_CB1 = rnorm(50, mean = 0.5, sd = 0.1),   # Ativação dos receptores CB1
  Ativacao_CB2 = rnorm(50, mean = 0.3, sd = 0.1),   # Ativação dos receptores CB2
  Efeito_Observado = runif(50, min = 0, max = 1)    # Efeito neurológico observado
)

# Exibir os primeiros registros
head(dados)
Resumo Estatístico por Região do Cérebro
Usamos o pacote dplyr para agrupar os dados por região do cérebro e calcular médias das variáveis Concentração_THC, Ativacao_CB1, Ativacao_CB2 e Efeito_Observado.

r
Copiar código
resumo_estatistico <- dados %>%
  group_by(Regiao) %>%
  summarize(
    Média_THC = mean(Concentração_THC),
    Média_Ativacao_CB1 = mean(Ativacao_CB1),
    Média_Ativacao_CB2 = mean(Ativacao_CB2),
    Média_Efeito_Observado = mean(Efeito_Observado)
  )

# Exibir o resumo estatístico
print(resumo_estatistico)
Visualização Gráfica
Por fim, utilizamos o pacote ggplot2 para criar um gráfico de dispersão que mostra a relação entre a Concentração de THC e a Ativação dos Receptores CB1. O tamanho dos pontos indica a Ativação dos Receptores CB2, e as cores indicam as diferentes regiões do cérebro.

r
Copiar código
ggplot(data = dados, aes(x = Concentração_THC, y = Ativacao_CB1, color = Regiao, size = Ativacao_CB2)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Relação entre Concentração de THC e Ativação dos Receptores CB1 e CB2",
    x = "Concentração de THC (ng/mg)",
    y = "Ativação dos Receptores CB1",
    size = "Ativação CB2"
  ) +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")
Este gráfico facilita a visualização da relação entre a concentração de THC e as respostas neurológicas em diferentes regiões do cérebro.
