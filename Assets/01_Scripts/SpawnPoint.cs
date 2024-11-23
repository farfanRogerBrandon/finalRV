using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class SpawnPoint : MonoBehaviour
{
    // Start is called before the first frame update

    public List<GameObject> Gms1 = new List<GameObject>();
    public List<GameObject> Gms2 = new List<GameObject>();
    public List<GameObject> Gms3 = new List<GameObject>();
    public List<GameObject> Gms4 = new List<GameObject>();
    public List<GameObject> Gms5 = new List<GameObject>();
    public List<GameObject> Gms6 = new List<GameObject>();
    public List<GameObject> Gms7 = new List<GameObject>();
    public List<GameObject> Gms8 = new List<GameObject>();




    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    public void SetGMACTIVE(int n) {


        switch (n)
        {
            case 1:
                Activate(Gms1);
                break;
            case 2:
                Activate(Gms2); 
                break;
            case 3:
                Activate(Gms3);
                break;
            case 4:
                Activate(Gms4);
                break;
            case 5:
                Activate(Gms5);
                break;

        }
    }

    public void Activate(List<GameObject> list)
    {
        foreach (var item in list)
        {
            item.SetActive(true);
        }
    }

    public void Clean()
    {
        GameObject[] enemies = GameObject.FindGameObjectsWithTag("Enemies");
        foreach (GameObject enemy in enemies)
        {
            Destroy(enemy);
        }
    }
}
