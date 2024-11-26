using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyAnim : MonoBehaviour
{
    // Start is called before the first frame update
    Enemy e;

    private void Start()
    {
        e = transform.GetComponentInParent<Enemy>();
    }
    public void Shoot()
    {
        GameObject gmm = Instantiate(e.Bullet, e.BulletPoint.transform.position, e.BulletPoint.transform.rotation);
        gmm.GetComponent<Bullet>().speed = e.BulletSpeed;
    }

    public void finishAttack()
    {
      e.isAttacking2 = false;
    }
}
