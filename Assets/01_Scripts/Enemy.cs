using Assets._01_Scripts;
using System.Collections;
using System.Collections.Generic;
using System.Xml.Linq;
using UnityEngine;

public class Enemy : MonoBehaviour, IEnemy
{
    // Start is called before the first frame update
    public float life = 14f;

    public bool isAttacking = false;

    public float timeBtwAttacks = 3f;
    public float currentTime = 0;
    public float speed = 6f;
    public float range = 10f;
    public float damage = 5f;


    public GameObject BulletPoint;
    public GameObject Bullet;

    public Animator anim;
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void TakeDamage(GameObject part, float d, Transform pos)
    {
        //   AudioManager.instance.PlaySFX(acTakeDamage);

        life -= d;

        GameObject gm = Instantiate(part, pos.position, gameObject.transform.rotation);
        Destroy(gm, 1.2f);
        // count++;

        letsDie();
    }
    public bool isDIed = false;
    public void letsDie(int n = 0)
    {
        if (life <= 0)
        {
            anim.SetTrigger("Die");
            Destroy(gameObject, 1.3f);
            if (n == 0)
            {
                if (!isDIed)
                {
                    isDIed = true;
                    int myN = Random.Range(1, 11);

                    if (myN >= 4)
                    {
                       
                    }
                }

            }

        }
    }
}
