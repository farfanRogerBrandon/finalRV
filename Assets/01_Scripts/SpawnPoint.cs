using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnPoint : MonoBehaviour
{
    // Start is called before the first frame update

    public List<Transform> spawnPoints = new List<Transform>();
    public List<GameObject> enemiesToSpawn = new List<GameObject>();




    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player")) 
        { 
            Destroy(gameObject);
            ///

            for (int  i = 0;  i < spawnPoints.Count;  i++)
            {
                GameObject enemy =  Instantiate(enemiesToSpawn[i], new Vector3(spawnPoints[i].position.x, spawnPoints[i].position.y, spawnPoints[i].position.z ), Quaternion.identity);
            }


        } 
    }
}
