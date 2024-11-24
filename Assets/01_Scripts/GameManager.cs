using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    
    public List<AudioClip> audioclis = new List<AudioClip>();


    public List<string> animTriggers = new List<string>();
    public List<bool> animBools = new List<bool>();


    public List<GameObject> currentEnemiesToVerify = new List<GameObject>();
    public Animator animator;


    public static GameManager instance;


    public int currentIndex = 0;
    public int maxIndex = 10;
    private void Awake()
    {
        instance = this;
    }

    void Start()
    {
        //instance = this;
        maxIndex = animTriggers.Count;
        for (int i = 0; i < animTriggers.Count; i++)
        {
            animBools.Add(false);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void GameObjectsEnded()
    {
        animator.SetTrigger("a");
        //animBools[currentIndex] = true;
        //if (currentIndex < maxIndex)
        //{
        //    currentIndex++;
        //}

    }
}

