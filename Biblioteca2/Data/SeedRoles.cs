﻿using Microsoft.AspNetCore.Identity;

namespace Biblioteca2.Data
{
    public static class SeedRoles
    {
            public static void Seed(RoleManager<IdentityRole> roleManager)
            {
                if(roleManager.Roles.Any()==false)
                {
                    roleManager.CreateAsync(new IdentityRole("Leitor")).Wait();
                    roleManager.CreateAsync(new IdentityRole("Bibliotacario")).Wait();
                    roleManager.CreateAsync(new IdentityRole("Administrador")).Wait();
                }
            }
    }
}