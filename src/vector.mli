(** A [Vector.t] is a general-purpose array whose elements are [Value.t]'s.

    [(Info-goto-node "(elisp)Vectors")] *)

open! Core_kernel
open! Import

type t [@@deriving sexp_of]

include Value.Subtype with type t := t

(** [(describe-function 'make-vector)] *)
val create : len : int -> Value.t -> t

val length : t -> int

val get : t -> int -> Value.t

val set : t -> int -> Value.t -> unit

(** [(describe-function 'vector)] *)
val of_list : Value.t list -> t

(** [(describe-function 'vconcat)] *)
val concat : t list -> t

val to_array : t -> f:(Value.t -> 'a) -> 'a array