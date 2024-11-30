namespace Biblioteca.Models
{
    public class Utilizador
    {
        public int id { get; set; }
        public string? Nome { get; set; } // Nome do utilizador
        public string Estado_Conta { get; set; } = "Ativa"; // Default: Ativa
        public DateTime Data_Criacao { get; set; } = DateTime.Now; // Default: Agora
        public string? Username { get; set; }
    }
}
