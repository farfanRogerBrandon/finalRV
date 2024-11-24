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
    public List<GameObject> Gms9 = new List<GameObject>();
    public List<GameObject> Gms10 = new List<GameObject>();




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
            case 6:
                Activate(Gms6);
                break;
            case 7:
                Activate(Gms7);
                break;
            case 8: //rápidos
                Activate(Gms8);
                break;
            case 9:
                Activate(Gms9);
                break;
            case 10:
                Activate(Gms10);
                    break;
            case 11:
                //Cargar nueva escena con el enemigo xd 
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
