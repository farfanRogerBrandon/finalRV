using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Player : MonoBehaviour
{
    // Start is called before the first frame update

    public float Life = 10f;
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void TakeDamage(GameObject impacteffect, float damage)
    {
       

        Instantiate(impacteffect, gameObject.transform.position, Quaternion.identity);
        Life -= damage;
        //HealthCheck(false);
        if (Life <= 0)
        {


            SceneManager.LoadScene("GameOver");
        }
        //AudioManager.instance.PlaySFX(TakeDamageAudio);
    }
}
