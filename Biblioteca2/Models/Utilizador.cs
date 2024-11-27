using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Biblioteca2.Models
{
    
    public class Utilizador : IdentityUser
    {
        //[Key]
        //public int ID_Utilizador { get; set; }

        [Required]
        public string? Estado_Conta { get; set; } // Ex: "Ativa", "Bloqueada"

        public DateTime Data_Criacao { get; set; } = DateTime.Now;
    }
}
