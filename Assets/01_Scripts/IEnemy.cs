using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;

namespace Assets._01_Scripts
{
    public interface IEnemy
    {
        void TakeDamage(GameObject part, float d, Transform pos);
        void TakeDamage2(GameObject part, float d, Transform pos);

    }
}
