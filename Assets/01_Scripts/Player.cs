using Oculus.Interaction.OVR.Input;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using static UnityEngine.EventSystems.EventTrigger;

public class Player : MonoBehaviour
{
    // Start is called before the first frame update

    public float Life = 10f;

    public Transform bulletPOint;
    public GameObject Bullet;


    public GameObject NormalAttack;
    public GameObject NormalAttackEffect;


    public GameObject NormalAttack2;
    public GameObject NormalAttackEffect2;

    public GameObject NormalAttackEffectAux;


    public bool isCharging = false;

    public bool attackChanged = false;
    public float maxDamageNormal = 3f;

    public float currentDamage = 0f;


    OVRInput.Button btn = OVRInput.Button.SecondaryIndexTrigger;
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //if (OVRInput.GetDown(btn))
        //{
        //    Instantiate(Bullet, bulletPOint.position, bulletPOint.rotation);
           
        //}
        //if (OVRInput.Get(btn))
        //{
        //    Instantiate(Bullet, bulletPOint.position, bulletPOint.rotation);

        //}
        //if (OVRInput.GetUp(btn))
        //{
        //    Instantiate(Bullet, bulletPOint.position, bulletPOint.rotation);
        //}
        AttackNormal();
    }


    void AttackNormal()
    {
        
            if (OVRInput.GetDown(btn) && isCharging == false)
            {

                NormalAttackEffectAux = Instantiate(NormalAttackEffect, bulletPOint.transform);
                isCharging = true;
                currentDamage = 0f;
               

            }
            if (OVRInput.Get(btn))
            {
                
                if (currentDamage < maxDamageNormal)
                {
                    currentDamage += Time.deltaTime;

                }

                if (currentDamage > maxDamageNormal / 1.5f && attackChanged == false)
                {
                    Destroy(NormalAttackEffectAux);

                    NormalAttackEffectAux = Instantiate(NormalAttackEffect2, bulletPOint.transform);
                    attackChanged = true;
                }


            }
            if (OVRInput.GetUp(btn) && isCharging == true)
            {
                GameObject gmAux = null;
            Destroy(NormalAttackEffectAux);
            if (currentDamage < maxDamageNormal / 1.5f)
                {
                    gmAux = NormalAttack;
                }
                else
                {
                    gmAux = NormalAttack2;
                }


                GameObject gm = Instantiate(gmAux, bulletPOint.transform.position, bulletPOint.transform.rotation);

                currentDamage = 0;
                isCharging = false;
                attackChanged = false;


        }
       
    }
    public void TakeDamage(GameObject impacteffect, float damage, Transform t)
    {
       

       GameObject gm =  Instantiate(impacteffect,t.position, Quaternion.identity);
        Destroy(gm, 1.3f);
        Life -= damage;
        //HealthCheck(false);
        if (Life <= 0)
        {


            SceneManager.LoadScene(0);
        }
        //AudioManager.instance.PlaySFX(TakeDamageAudio);
    }
}
