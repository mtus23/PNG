﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PNG.Models
{
    public class Account
    {
        public string Email { get; set; }
        public string Password { get; set; }
        public string UserName { get; set; }
        public int RoleID { get; set; }
        public int StatusID { get; set; }
    }
}