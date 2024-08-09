# Instalar e carregar o pacote necessário
install.packages("dplyr")
library(dplyr)

# Simulação de dados
set.seed(123)  # Para reprodutibilidade

# Regiões do cérebro simuladas
regioes <- c("Córtex Pré-frontal", "Hipocampo", "Amígdala", "Cerebelo", "Núcleo Accumbens")

# Dados simulados
dados <- data.frame(
  Regiao = rep(regioes, each = 10),
  Concentração_THC = runif(50, min = 1, max = 10),  # Concentração de THC em ng/mg
  Ativacao_CB1 = rnorm(50, mean = 0.5, sd = 0.1),   # Ativação dos receptores CB1
  Ativacao_CB2 = rnorm(50, mean = 0.3, sd = 0.1),   # Ativação dos receptores CB2
  Efeito_Observado = runif(50, min = 0, max = 1)    # Efeito neurológico observado
)

# Exibindo os primeiros registros do quadro estatístico
head(dados)

# Resumo estatístico por região do cérebro
resumo_estatistico <- dados %>%
  group_by(Regiao) %>%
  summarize(
    Média_THC = mean(Concentração_THC),
    Média_Ativacao_CB1 = mean(Ativacao_CB1),
    Média_Ativacao_CB2 = mean(Ativacao_CB2),
    Média_Efeito_Observado = mean(Efeito_Observado)
  )

# Exibindo o quadro estatístico resumido
print(resumo_estatistico)

# Instalar e carregar o pacote necessário
install.packages("ggplot2")
library(ggplot2)

# Criando o gráfico de dispersão
ggplot(data = dados, aes(x = Concentração_THC, y = Ativacao_CB1, color = Regiao, size = Ativacao_CB2)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Relação entre Concentração de THC e Ativação dos Receptores CB1 e CB2",
    x = "Concentração de THC (ng/mg)",
    y = "Ativação dos Receptores CB1",
    size = "Ativação CB2"
  ) +
  theme_minimal() +
  scale_color_brewer(palette = "Set1")  # Escolha uma paleta de cores agradável

