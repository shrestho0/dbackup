import { PUBLIC_LINODE_OBJECT_BUCKET as LINODE_OBJECT_BUCKET } from '$env/static/public';
import { PUBLIC_LINODE_OBJECT_STORAGE_ENDPOINT as LINODE_OBJECT_STORAGE_ENDPOINT } from '$env/static/public';
import { PUBLIC_LINODE_OBJECT_STORAGE_REGION as LINODE_OBJECT_STORAGE_REGION } from '$env/static/public';
import { PUBLIC_LINODE_OBJECT_STORAGE_ACCESS_KEY_ID as LINODE_OBJECT_STORAGE_ACCESS_KEY_ID } from '$env/static/public';
import { PUBLIC_LINODE_OBJECT_STORAGE_SECRET_ACCESS_KEY as LINODE_OBJECT_STORAGE_SECRET_ACCESS_KEY } from '$env/static/public';

import { Credentials } from 'aws-sdk';
import S3 from 'aws-sdk/clients/s3';

const s3Client = new S3({
    region: LINODE_OBJECT_STORAGE_REGION,
    endpoint: LINODE_OBJECT_STORAGE_ENDPOINT,
    sslEnabled: true,
    s3ForcePathStyle: false,
    credentials: new Credentials({
        accessKeyId: LINODE_OBJECT_STORAGE_ACCESS_KEY_ID,
        secretAccessKey: LINODE_OBJECT_STORAGE_SECRET_ACCESS_KEY,
    }),
});

export async function uploadFileToObjectStorage(base64Data, path, fileName, fileType, extension) {
    const params = {
        Bucket: LINODE_OBJECT_BUCKET,
        Key: `${path}/${fileName}`,
        Body: base64Data,
        ACL: 'public-read',
        ContentEncoding: 'base64',
        ContentType: `${fileType}/${extension}`,
    };

    // see: http://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3.html#upload-property
    const { Location } = await s3Client.upload(params).promise();
    return Location;
}

export async function deleteFileFromObjectStorage(url) {
    const Key = url.split(`${LINODE_OBJECT_STORAGE_ENDPOINT}/`)[1];
    const params = {
        Bucket: LINODE_OBJECT_BUCKET,
        Key,
    };

    // see: https://docs.aws.amazon.com/AWSJavaScriptSDK/latest/AWS/S3.html#deleteObject-property
    // eslint-disable-next-line consistent-return
    return s3Client.deleteObject(params).promise();
}