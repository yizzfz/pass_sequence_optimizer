; ModuleID = 'cdjpeg.ll'
source_filename = "cdjpeg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stdin = external global %struct._IO_FILE*, align 8
@stdout = external global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind readonly uwtable
define i32 @keymatch(i8* nocapture readonly, i8* nocapture readonly, i32) #0 {
  %4 = load i8, i8* %0, align 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %._crit_edge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %3
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %24
  %.in = phi i8 [ %26, %24 ], [ %4, %.lr.ph.preheader ]
  %.pn = phi i8* [ %6, %24 ], [ %0, %.lr.ph.preheader ]
  %.029 = phi i8* [ %8, %24 ], [ %1, %.lr.ph.preheader ]
  %.038 = phi i32 [ %25, %24 ], [ 0, %.lr.ph.preheader ]
  %6 = getelementptr inbounds i8, i8* %.pn, i64 1
  %7 = sext i8 %.in to i32
  %8 = getelementptr inbounds i8, i8* %.029, i64 1
  %9 = load i8, i8* %.029, align 1
  %10 = sext i8 %9 to i32
  %11 = icmp eq i8 %9, 0
  br i1 %11, label %.loopexit.loopexit, label %12

; <label>:12:                                     ; preds = %.lr.ph
  %13 = tail call i16** @__ctype_b_loc() #4
  %14 = load i16*, i16** %13, align 8
  %15 = sext i8 %.in to i64
  %16 = getelementptr inbounds i16, i16* %14, i64 %15
  %17 = load i16, i16* %16, align 2
  %18 = and i16 %17, 256
  %19 = icmp eq i16 %18, 0
  br i1 %19, label %22, label %20

; <label>:20:                                     ; preds = %12
  %21 = tail call i32 @tolower(i32 %7) #5
  br label %22

; <label>:22:                                     ; preds = %12, %20
  %.04 = phi i32 [ %21, %20 ], [ %7, %12 ]
  %23 = icmp eq i32 %.04, %10
  br i1 %23, label %24, label %.loopexit.loopexit

; <label>:24:                                     ; preds = %22
  %25 = add nuw nsw i32 %.038, 1
  %26 = load i8, i8* %6, align 1
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %24
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %.03.lcssa = phi i32 [ 0, %3 ], [ %25, %._crit_edge.loopexit ]
  %not. = icmp sge i32 %.03.lcssa, %2
  %. = zext i1 %not. to i32
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph, %22
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi i32 [ %., %._crit_edge ], [ 0, %.loopexit.loopexit ]
  ret i32 %.0
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #1

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #2

; Function Attrs: noinline norecurse nounwind readonly uwtable
define %struct._IO_FILE* @read_stdin() #3 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8
  ret %struct._IO_FILE* %1
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define %struct._IO_FILE* @write_stdout() #3 {
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8
  ret %struct._IO_FILE* %1
}

attributes #0 = { noinline nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
