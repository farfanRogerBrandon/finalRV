using Assets._01_Scripts;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using UnityEngine;
using UnityEngine.UIElements;

public class Enemy : MonoBehaviour, IEnemy
{
    public float BulletSpeed=4f;
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


    public GameObject target;

    public EnemyType enemyType;
    public float maxDistance;

    public bool isWaiter = false;

   
    void Start()
    {
       
        target = GameObject.FindGameObjectWithTag("Player");
        float timemore = Random.Range(-2, 2.1f);
        timeBtwAttacks += timemore;

        speed += timemore;

        if (isWaiter) {
            GameManager.instance.currentEnemiesToVerify.Add(gameObject);
        }
    }

    // Update is called once per frame
    void Update()
    {
        rotate(target.transform.position);
        if (enemyType == EnemyType.torreta) 
        {
            Attack();
        }
        else if (enemyType == EnemyType.cerca) 
        {
            AttackDisance();
        }
        else if ( enemyType == EnemyType.lejos)
        {
            Attack(); // por el momento, luego es con animación.
        }

        
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
    public void TakeDamage2(GameObject part, float d, Transform pos)
    {
        //   AudioManager.instance.PlaySFX(acTakeDamage);

        life -= d;

        GameObject gm = Instantiate(part, pos.position, gameObject.transform.rotation);
        Destroy(gm, 1.2f);
        // count++;
        transform.Translate(Vector3.back * 133.7f*Time.deltaTime);
       
        letsDie();
    }
    public bool isDIed = false;
    public void letsDie(int n = 0)
    {
        if (life <= 0)
        {
           // anim.SetTrigger("Die");
            Destroy(gameObject, 0f);
        }
    }



    public void Attack()
    {
        if (currentTime < timeBtwAttacks) {

            currentTime += Time.deltaTime;
        }
        else
        {
            currentTime = 0;
            GameObject gmm =Instantiate(Bullet, BulletPoint.transform.position, BulletPoint.transform.rotation);
            gmm.GetComponent<Bullet>().speed = BulletSpeed;
        }
    }

    public bool isWalking = false;
    public float timeBtwnAnimsNEar = 2f;
    public void AttackDisance()
    {
        if (Vector3.Distance(gameObject.transform.position, target.transform.position)> maxDistance)
        {
            
            transform.Translate(Vector3.forward * speed * Time.deltaTime);
            if (!isWalking) 
            {
                // caminar animación;
                isWalking = true;
            }

        }
        else
        {
            if (isWalking)
            {
                isWalking = false;


                //que ya no camine
                Invoke("MakeAttackAnimation", timeBtwnAnimsNEar);// aver si da xd
            }

        }
    }


    void MakeAttackAnimation()
    {
        //
    }
    void rotate(Vector3 t)
    {
        Vector3 dir = t - transform.position;

        float angleZ = Mathf.Atan2(dir.x, dir.z);
        angleZ *= Mathf.Rad2Deg;

        transform.rotation = Quaternion.Euler(0, angleZ, 0);
    }
    private void OnDestroy()
    {
        if (isWaiter)
        {
          GameManager.instance.currentEnemiesToVerify.RemoveAt(0);
            if (GameManager.instance.currentEnemiesToVerify.Count <= 0)
            {
                //siguiente
                GameManager.instance.GameObjectsEnded();
            }
        }
    }
}


public enum EnemyType
{
    lejos,
    cerca,
    torreta,
}