using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyAnim : MonoBehaviour
{
    // Start is called before the first frame update
   public void Shoot()
    {
        Enemy e =transform.GetComponentInParent<Enemy>();
        GameObject gmm = Instantiate(e.Bullet, e.BulletPoint.transform.position, e.BulletPoint.transform.rotation);
        gmm.GetComponent<Bullet>().speed = e.BulletSpeed;
    }
}
