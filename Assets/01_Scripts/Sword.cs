using Assets._01_Scripts;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Sword : MonoBehaviour
{
    // Start is called before the first frame update

    public float damage = 0.5f;
    void Start()
    {
        
    }
    public GameObject impactEffect;
    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("BulletEnemy"))
        {
            Destroy(other.gameObject);
            GameObject gm = Instantiate(impactEffect, other.transform.position, Quaternion.identity);
            Destroy(gm, 1.2f);
           // Destroy(gameObject);
        }
        else if (other.CompareTag("Enemies"))
        {


            IEnemy e = other.GetComponent<IEnemy>();
            e.TakeDamage2(impactEffect, damage, other.gameObject.transform);

           
        }
    }
}
