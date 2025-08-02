export function toast(message = 'Default message', color = TOAST.info, duration = 4000) {
    // Create a toast element
    const toastElement = document.createElement('div');
    toastElement.className = 'app-toast fade-in';
    toastElement.innerHTML = message;
    toastElement.style.color = color;
    toastElement.style.fontWeight = '600';
    toastElement.style.borderColor = color;
  
    // Append the toast to the body
    document.body.appendChild(toastElement);
  
    // Set a timeout to remove the toast after a certain duration
    setTimeout(() => {
      document.body.removeChild(toastElement);
    }, duration); // Adjust the duration (in milliseconds) as needed
  }

  export const TOAST = {
    warn : '#f39c12',
    info : '#3498db',
    success : '#2ecc71',
    error : '#c0392b',
}


export function getId(prefix: string = 'id'): string {
  if (prefix) {
    prefix = createSlug(prefix);
  }
  prefix += '-';
  const randomNumber = Math.floor(Math.random() * 1000); // Generate a 3-digit random number
  return `${prefix}${randomNumber}-${Date.now().toString(36)}`;
}

function createSlug(prefix: string): string {
  return prefix
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-');
}
