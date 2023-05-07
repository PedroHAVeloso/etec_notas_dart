/*
* Qualidade e Teste de Software - Tarefa 1
* Aluno: Pedro Henrique Alves Veloso
* Programa em Dart para calcular e guardar a média de uma lista de alunos
* Executar no prompt de comando
* ! As notas quebradas devem ser com ponto ao invés de vírgula !
* ! Não pode receber nomes iguais !
*/

import 'dart:io';

void main() {
  // Cria o array para as duas listas: nomes e notas
  List arrayNomesNotas = [[], []];

  // Inicia o "programa" passando o 'arrayNomesNotas'
  programa(arrayNomesNotas);
}

void programa(List arrayNomesNotas) {
  // Pergunta ao usuário qual tarefa ele deseja realizar
  print("\nQue tarefa você quer realizar?\n" +
      "1 - Calcular a Média do(s) aluno(s)\n" + // Calcula a média
      "2 - Buscar a Média do(s) aluno(s)\n" + // Busca a média
      "3 - Cancelar e sair do programa\n" + // Fecha o programa
      "Digite o número do que deseja fazer:");

  // Inicia um for para ler a tarefa que o usuário informar
  // Caso ele informe um das três, inicia ela
  // Caso ele informe um valor incorreto, diminui o valor do 'iEscolher'
  for (int iEscolher = 0; iEscolher == 0; iEscolher++) {
    String strTarefa = // Cria a variável para o valor informado
        stdin.readLineSync()!; // E atribui à ela esse valor

    if (strTarefa == "1") {
      // Se a tarefa informada for '1', atribui o valor da função "calcMediaAluno"
      // (que será iniciada) ao 'arrayNomesNotas'
      arrayNomesNotas = calcMediaAlunos(arrayNomesNotas);
      programa(arrayNomesNotas); // Retorna ao programa após o término da função
    } else if (strTarefa == "2") {
      // Se a tarefa informada for '2', inicia a função "lerMediaAlunos", passando
      // para ela o 'arrayNomesNotas' para a busca das médias
      lerMediaAlunos(arrayNomesNotas);
      programa(arrayNomesNotas); // Retorna ao programa após o término da função
    } else if (strTarefa == "3") {
      // Se a tarefa informada for '3', fecha o programa
      exit(0);
    } else {
      // Se o usuário não tiver informado nenhum dos três números, imprime um
      // pedido para que ele insira um número válido
      print("Digite um número válido, por favor!");
      // E diminui o valor do index para que o for se repita
      iEscolher--;
    }
  }
}

// Função para calcular as médias.
// Retorna um array com duas listas, uma de nomes e uma de notas médias
List calcMediaAlunos(arrayNomesNotas) {
  // Cria todas as principais variáves que serão utilizadas:
  int intQntVezes = // Variável da qtd de vezes para executar o programa,
      0; // Criada, recebe o valor 0, após receberá um valor do usuário

  String strNome, // Variáveis de filtro
      strNota, // Serão usadas para receber os valores dos inputs
      strQtdVezes; // Filtrarão se o usuário deseja cancelar a tarefa

  List<String> arrayNomes = []; // Lista para os nomes
  List<String> arrayNotas = []; // Lista para as notas

  double douMedia = 0.0; // Variável com a média momentânea de apenas um aluno

  // Pergunta quantas vezes o usuário deseja calcular
  print("\nVocê deseja calcular a média de quantos alunos?\n" +
      "Digite 'Cancelar' para cancelar a tarefa.");
  strQtdVezes = stdin.readLineSync()!; // Lê o valor informado pelo usuário

  // Faz a verificação se o usuário deseja cancelar a tarefa
  if (strQtdVezes == 'Cancelar') {
    // Se o usuário escreveu 'Cancelar', cancela a tarefa e
    // volta para o programa
    programa(arrayNomesNotas);
  } else {
    // Se não foi escrito 'Cancelar', tenta tranformar o 'strQtdVezes'
    // em um inteiro, caso dê erro no processo, informa o usuário para
    // informar um número inteiro e recomeça a função
    try {
      intQntVezes = int.parse(strQtdVezes);
    } catch (e) {
      // print(e);
      print("\nDigite um número inteiro, por favor!");
      calcMediaAlunos(arrayNomesNotas);
    }
  }

  // Informa ao usuário que o programa calculará a média da
  // quantidade de vezes informada
  print("\nOk! Vamos calcular a média de ${intQntVezes} alunos.\n" +
      "Digite 'Cancelar' a qualquer momento para cancelar a tarefa.\n");

  // Executa a quantidade de vezes informada a leitura
  // dos nomes e notas dos alunos
  for (int iPerguntas = 0; iPerguntas < intQntVezes; iPerguntas++) {
    // Imprime a pergunta do nome do aluno
    print("Informe o nome do aluno:");
    strNome = stdin.readLineSync()!; // Lê o valor informado

    // Faz a verificação se o usuário deseja cancelar a tarefa
    if (strNome == 'Cancelar') {
      // Se o usuário escreveu 'Cancelar', cancela a tarefa e
      // volta para o programa
      programa(arrayNomesNotas);
    } else {
      // Se não foi escrito 'Cancelar',
      // adiciona o valor informado na lista de nomes
      arrayNomes += [strNome];
    }

    // Lê as 4 notas do aluno (a partir do 1º até o 4º bimestre)
    for (int iNotas = 1; iNotas <= 4; iNotas++) {
      // Imprime a pergunta da nota do bimestre
      print(
          "Informe a nota de ${arrayNomes[iPerguntas]} no ${iNotas}º bimestre:");
      strNota = stdin.readLineSync()!; // Lê a resposta do usuário

      // Faz a verificação se o usuário deseja cancelar a tarefa
      if (strNota == 'Cancelar') {
        // Se o usuário escreveu 'Cancelar', cancela a tarefa e
        // volta para o programa
        programa(arrayNomesNotas);
      } else {
        // Se não foi escrito 'Cancelar', tenta tranformar o 'strNota'
        // em um real e somar na variável 'douMedia'
        try {
          douMedia += double.parse(strNota);
        } catch (e) {
          // print(e);
          // Caso ocorra um erro, informa pedindo um número
          print("Informe um número, por favor!");
          iNotas--; // E diminui o valor do iNotas para o loop continuar
        }
      }
    }

    // Após o for:
    douMedia = douMedia / 4; // Cálcula a média do aluno
    arrayNotas += // Adiciona a média no 'arrayNotas'
        [douMedia.toString()]; // Convertendo ela de real para String
    douMedia = 0.0; // Define a 'douMedia' para realizar uma nova leitura

    // Imprime o nome e nota do aluno na tela
    print(
        "\nO aluno ${arrayNomes[iPerguntas]} obteve uma média de ${arrayNotas[iPerguntas]}\n" +
            "Vamos calcular outro aluno agora.\n");
  }

  // Após executar a quantidade de vezes desejada, informa que a tarefa terminou
  print(
      "Todos os alunos e suas respectivas notas foram contabilizados com sucesso!");

  // Retorna o Array com os nomes e o Array com as notas
  return [arrayNomes, arrayNotas];
}

// Função para buscar um aluno e sua média.
// Exige passar o valor do arrayNomesNotas
void lerMediaAlunos(List arrayNomesNotas) {
  // Cria a constante de nota
  const double conNOTACORTE = 6.0;

  // Cria o booleano de aluno se o aluno foi achado ou não
  bool booAchado = false;

  // Separa o arrayNomesNotas em uma lista para Nomes e outra para Notas
  List arrayNomes = arrayNomesNotas[0]; // Lista para nomes
  List arrayNotas = arrayNomesNotas[1]; // Lista para notas

  // Calcula a quantidade de itens na lista de nomes
  int tamanhoArray = arrayNomes.length;

  // Pergunta ao usuário o que ele deseja fazer
  print("\nEscolhe o que deseja fazer:\n" +
      "1 - Pesquisar o nome de um aluno\n" + // Pesquisa um nome específico de aluno
      "2 - Ver todos os alunos e médias\n" + // Vê a média de todos os alunos
      "3 - Cancelar a tarefa\n" + // Cancela a tarefa e volta para o programa
      "Digite o número do que deseja fazer:");

  // Lê a tarefa que o usuário quer executar
  for (int iEscolher = 0; iEscolher == 0; iEscolher++) {
    String strTarefa = // Cria uma String para o filtro do valor
        stdin.readLineSync()!; // Lê o valor informado pelo usuário

    // Verifica qual tarefa o usuário digitou
    if (strTarefa == "1") {
      // Se '1', imprime um pedido para o usuário o nome do aluno
      print("\nQual o nome do aluno que você deseja pesquisar?\n" +
          "Digite 'Cancelar' para cancelar a busca.");
      String strNome = // Cria a String para a busca do nome e filtro
          stdin.readLineSync()!; // Lê o valor informado

      if (strNome == 'Cancelar') {
        // Se o usuário informar 'Cancelar', cancela a busca e retorna à função
        lerMediaAlunos(arrayNomesNotas);
      } else {
        // Se o usuário informar um nome, procura dentro do Array esse nome
        for (int iPesquisar = 0; iPesquisar < tamanhoArray; iPesquisar++) {
          // Verifica se o nome informado equivale à algum do array
          if (strNome == arrayNomes[iPesquisar]) {
            // Informa o nome, a nota e se o aluno foi aprovado
            // ou reprovado (caso ele tenha sido encontrado)
            print(
                "\nO aluno(a) ${strNome} teve uma média de ${arrayNotas[iPesquisar]}");

            // Verifica se o aluno tem uma nota maior que a de corte
            if (double.parse(arrayNotas[iPesquisar]) >= conNOTACORTE) {
              // Se verdadeiro, imprime que ele passou de ano
              print(
                  "Portanto, ele obteve uma nota maior que 6.0 e PASSOU de ano!"); // Informa que o aluno passou de ano
            } else {
              // Se falso, imprime que ele reprovou de ano
              print(
                  "Portanto, ele não obteve uma nota maior que 6.0 e REPROVOU de ano!"); // Informa que o aluno reprovou de ano
            }
            // Se o aluno foi achado, o booleano
            // de achado é atruibo como verdadeiro e o for é parado
            booAchado = true;
            break;
          }
        }

        // Se o booleano for falso, o aluno não foi achado, informando assim uma mensagem
        if (booAchado == false) {
          print(
              "\nMe desculpe, procurei muito e não achei o nome que você digitou :(");
        }

        // Retorna para a função de 'lerMediaAlunos'
        lerMediaAlunos(arrayNomesNotas);
      }
    }
    // Se '2', informa todos os nomes e notas cadastrados no Array
    else if (strTarefa == "2") {
      print(""); // Uma quebra de linha (para um melhor visual no console)

      // Procura todos os alunos cadastrados:
      for (int iPesquisar = 0; iPesquisar < tamanhoArray; iPesquisar++) {
        // Informa (se encontrado) o nome, nota e se foi reprovado ou não
        if (double.parse(arrayNotas[iPesquisar]) >= conNOTACORTE) {
          // Se a nota for igual ou maior que a de corte:
          print(
              "Aluno: ${arrayNomes[iPesquisar]}  |  Nota: ${arrayNotas[iPesquisar]}  |  Situação: Aprovado");
          // Define o booleano de achado como verdadeiro
          booAchado = true;
        } else {
          // Se a nota for menor que a de corte:
          print(
              "Aluno: ${arrayNomes[iPesquisar]}  |  Nota: ${arrayNotas[iPesquisar]}  |  Situação: Reprovado");
          // Define o booleano de achado como verdadeiro
          booAchado = true;
        }
      }

      // Se o booleano de achado for falso, nenhum aluno foi encontrado, exibindo uma mensagem
      if (booAchado == false) {
        print("Me desculpe, a lista de nomes está vazia :(");
      }

      // Retorna para a função
      lerMediaAlunos(arrayNomesNotas);
    }
    // Se '3', cancela a função
    else if (strTarefa == "3") {
      // A tarefa é cancelada e volta para o programa
      programa(arrayNomesNotas);
    } else {
      // Se o usuário não digitou nenhum dos três números,
      // pede um número válida
      print("Digite um número válido, por favor!");
      // E diminui o valor do index para refazer a leitura
      iEscolher--;
    }
  }
}
