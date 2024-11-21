using Assets._01_Scripts;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FinalEnemy : MonoBehaviour, IEnemy
{
    public float life = 14f;

    public bool isAttacking = false;

    public float timeBtwAttacks = 3f;
    public float currentTime = 0;
    public float speed = 6f;
    public float range = 10f;
    public float damage = 5f;


    public GameObject BulletPoint;
    public GameObject Bullet;

    public GameObject Target;


    public Animator anim;


    public Vector3 objetivePoint = Vector3.zero;


    public Transform minPointLeft;
    public Transform maxPointRight;

    public AudioClip receiveDamage;

    public GameObject takeDamage;
    public GameObject element;



    int atType = -1;
    void Start()
    {
        objetivePoint = Vector3.zero;


        GetTarget();


    }

   
    void Update()
    {

        if (!isAttacking)
        {
            rotate(Target.transform.position);
            if (currentTime < timeBtwAttacks)
            {
                currentTime += Time.deltaTime;
            }
            else
            {
                isAttacking = true;
                atType = Random.Range(0, 3);
                objetivePoint = Vector3.zero;
                if (atType >= 1 && Vector3.Distance(Target.transform.position, transform.position) <= range)
                {

                    Attack2();
                }
                else
                {
                    atType = 0;
                }

            }
        }
        else
        {
            if (atType == 0)
            {
                Patrullate();
                rotate(objetivePoint);
                Movement();
            }
        }




    }
    void GetTarget()
    {
        GameObject targetGo = GameObject.FindGameObjectWithTag("Player");
        if (targetGo != null)
        {
            Target = targetGo;
        }
    }


    void rotate(Vector3 t)
    {
        Vector3 dir = t - transform.position;

        float angleZ = Mathf.Atan2(dir.x, dir.z);
        angleZ *= Mathf.Rad2Deg;

        transform.rotation = Quaternion.Euler(0, angleZ, 0);
    }


    void Patrullate()
    {
        if (objetivePoint == Vector3.zero)
        {
            getObjetivePoint();
            anim.SetTrigger("Walk");

        }

        if (Mathf.Abs(transform.position.x - objetivePoint.x) <= 2 && Mathf.Abs(transform.position.z - objetivePoint.z) <= 2)
        {
            currentTime = 0;
            isAttacking = false;
            anim.SetTrigger("Idle");
            atType = -1;

        }




    }

    void Movement(int n = 1)
    {
        transform.Translate(new Vector3(0, 0, speed * n * Time.deltaTime));


    }

    void getObjetivePoint()
    {
        float x = Random.Range(minPointLeft.position.x, maxPointRight.position.x);
        float z = Random.Range(maxPointRight.position.z, minPointLeft.position.z);

        objetivePoint = new Vector3(x, 0, z);
    }


    void Attack2()
    {
        int n = Random.Range(1, 3);
        anim.SetTrigger("a" + n);
    }
    void FinishAnim()
    {
        isAttacking = false;
        currentTime = 0;
        atType = -1;
        anim.SetTrigger("Idle");
    }



    void ShootSP()
    {
        Vector3 dir = Target.transform.position - transform.position;

        float angleZ = Mathf.Atan2(dir.x, dir.z);
        angleZ *= Mathf.Rad2Deg;

        Instantiate(Bullet, BulletPoint.transform.position, Quaternion.Euler(0, angleZ, 0));

        Instantiate(Bullet, BulletPoint.transform.position, Quaternion.Euler(0, angleZ - 10, 0));
        Instantiate(Bullet, BulletPoint.transform.position, Quaternion.Euler(0, angleZ - 20, 0));
        Instantiate(Bullet, BulletPoint.transform.position, Quaternion.Euler(0, angleZ - 30, 0));
        Instantiate(Bullet, BulletPoint.transform.position, Quaternion.Euler(0, angleZ + 10, 0));
        Instantiate(Bullet, BulletPoint.transform.position, Quaternion.Euler(0, angleZ + 20, 0));


    }





    void GENERATE_ITEM()
    {
        int n = Random.Range(0, 3);
        //if (n == 0)
        //{
        //    Instantiate(powerUp, gameObject.transform.position, Quaternion.Euler(0, 0, 0));
        //}
    }
    int count = 0;



    public void TakeDamage2(GameObject part, float d, Transform pos)
    {
        //   AudioManager.instance.PlaySFX(acTakeDamage);

        life -= d;
        if (count <= 1)
        {
            GameObject gm = Instantiate(part, gameObject.transform.position, gameObject.transform.rotation);
            Destroy(gm, 0.35f);
            count++;
        }
        else
        {
            count = 0;
        }

        letsDie(2);
    }
    public void TakeDamage(GameObject part, float d, Transform pos)
    {
        //   AudioManager.instance.PlaySFX(acTakeDamage);

        life -= d;

        GameObject gm = Instantiate(part, pos.position, gameObject.transform.rotation);
        Destroy(gm, 1.1f);
        // count++;


        letsDie();
    }
    public bool isDie = false;
    public void letsDie(int n = 0)
    {
        if (life <= 0)
        {
            anim.SetTrigger("Die");
            Destroy(gameObject);
            if (n == 0)
            {
                if (!isDie)
                {
                    Instantiate(element, new Vector3(transform.position.x, transform.position.y + 1f, transform.position.z), Quaternion.identity);
                    isDie = true;
                }

            }
        }
    }
}
