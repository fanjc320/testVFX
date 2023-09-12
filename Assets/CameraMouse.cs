using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraMouse: MonoBehaviour
{
    #region Êý¾Ý
    private float X;
    private float Y;
    public float Xmax;
    public float Xmin;
    #endregion         

    // Update is called once per frame
    void Update()
    {
        X += Input.GetAxis("Mouse X");
        Y += Input.GetAxis("Mouse Y");
        Y = Mathf.Clamp(Y, Xmin, Xmax);
        this.transform.localEulerAngles = new Vector3(X, Y, 0);
    }
}

