using Assets._01_Scripts;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    //Vector3(0,-0.980000019,0)
    public bool isPlayer = true;
   // public GameObject impactEffect;
    public float damage = 2f;
    public float speed = 3.1f;


    public GameObject impactEffect;

//    public AudioClip EnemyTakeDamage;

    void Start()
    {
        Destroy(gameObject, 10f);
    }

    // Update is called once per frame
    void Update()
    {
        if (isPlayer)
        {
            transform.Translate(Vector3.forward * speed * Time.deltaTime);

        }
        else
        {
            transform.position += transform.forward * (speed * Time.deltaTime);
        }

    }


    private void OnTriggerEnter(Collider other)
    {
        if (isPlayer)
        {
            //Debug.Log("HOLA");
            if (other.CompareTag("Enemies"))
            {


                IEnemy e = other.GetComponent<IEnemy>();
                e.TakeDamage(impactEffect, damage, gameObject.transform);

                Destroy(gameObject);
            }
            else if (other.CompareTag("BulletEnemy"))
            {


               

                Destroy(other.gameObject);
                GameObject gm =  Instantiate(impactEffect, transform.position, Quaternion.identity);
                Destroy(gm,1.2f);
                Destroy(gameObject);

            }
        }
        else
        {
            if (other.CompareTag("MainCamera"))
            {
                //Debug.Log("HOLA ENEMY");

                Player e = other.GetComponent<Player>();
                e.TakeDamage(impactEffect, damage, gameObject.transform);
                Destroy(gameObject);
            }
        }
    }
}
