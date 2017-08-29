; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  tail call fastcc void @print_array(i32 2000, double* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph2:
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph2
  %indvars.iv8 = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next9, %._crit_edge ]
  %indvars.iv6 = phi i64 [ 1, %.lr.ph2 ], [ %indvars.iv.next7, %._crit_edge ]
  %4 = getelementptr inbounds double, double* %2, i64 %indvars.iv8
  store double -9.990000e+02, double* %4, align 8
  %5 = trunc i64 %indvars.iv8 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv8
  store double %6, double* %7, align 8
  %8 = add i32 %5, 2001
  %9 = and i64 %indvars.iv8, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %._crit_edge12.prol.preheader, label %._crit_edge12.prol.loopexit.unr-lcssa

._crit_edge12.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge12.prol

._crit_edge12.prol:                               ; preds = %._crit_edge12.prol.preheader
  %10 = sitofp i32 %8 to double
  %11 = fmul double %10, 2.000000e+00
  %12 = fdiv double %11, 2.000000e+03
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 0
  store double %12, double* %13, align 8
  br label %._crit_edge12.prol.loopexit.unr-lcssa

._crit_edge12.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph, %._crit_edge12.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge12.prol ], [ 0, %.lr.ph ]
  br label %._crit_edge12.prol.loopexit

._crit_edge12.prol.loopexit:                      ; preds = %._crit_edge12.prol.loopexit.unr-lcssa
  %14 = icmp eq i64 %indvars.iv8, 0
  br i1 %14, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge12.prol.loopexit
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge12 ]
  %15 = trunc i64 %indvars.iv to i32
  %16 = sub i32 %8, %15
  %17 = sitofp i32 %16 to double
  %18 = fmul double %17, 2.000000e+00
  %19 = fdiv double %18, 2.000000e+03
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  store double %19, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = trunc i64 %indvars.iv.next to i32
  %22 = sub i32 %8, %21
  %23 = sitofp i32 %22 to double
  %24 = fmul double %23, 2.000000e+00
  %25 = fdiv double %24, 2.000000e+03
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv.next
  store double %25, double* %26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv6
  br i1 %exitcond.1, label %._crit_edge.unr-lcssa, label %._crit_edge12

._crit_edge.unr-lcssa:                            ; preds = %._crit_edge12
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge12.prol.loopexit, %._crit_edge.unr-lcssa
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 2000
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  br i1 %exitcond11, label %._crit_edge3, label %.lr.ph

._crit_edge3:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double*, double* nocapture readonly) unnamed_addr #2 {
.lr.ph9:
  %sunkaddr4 = ptrtoint double* %2 to i64
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.lr.ph9
  %indvars.iv15 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next16, %._crit_edge ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  %5 = load double, double* %4, align 8
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv15
  store double %5, double* %6, align 8
  %7 = icmp sgt i64 %indvars.iv15, 0
  %sunkaddr1 = shl nsw i64 %indvars.iv15, 3
  %sunkaddr2 = add i64 %sunkaddr4, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  br i1 %7, label %._crit_edge19.preheader, label %._crit_edge

._crit_edge19.preheader:                          ; preds = %._crit_edge._crit_edge
  %xtraiter = and i64 %indvars.iv15, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge19.prol.loopexit.unr-lcssa, label %._crit_edge19.prol.preheader

._crit_edge19.prol.preheader:                     ; preds = %._crit_edge19.preheader
  br label %._crit_edge19.prol

._crit_edge19.prol:                               ; preds = %._crit_edge19.prol.preheader
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 0
  %9 = load double, double* %8, align 8
  %10 = load double, double* %2, align 8
  %11 = fmul double %9, %10
  %12 = fsub double %5, %11
  store double %12, double* %sunkaddr3, align 8
  br label %._crit_edge19.prol.loopexit.unr-lcssa

._crit_edge19.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge19.preheader, %._crit_edge19.prol
  %.lcssa25.unr.ph = phi double [ %12, %._crit_edge19.prol ], [ undef, %._crit_edge19.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge19.prol ], [ 0, %._crit_edge19.preheader ]
  %.unr.ph = phi double [ %12, %._crit_edge19.prol ], [ %5, %._crit_edge19.preheader ]
  br label %._crit_edge19.prol.loopexit

._crit_edge19.prol.loopexit:                      ; preds = %._crit_edge19.prol.loopexit.unr-lcssa
  %13 = icmp eq i64 %indvars.iv15, 1
  br i1 %13, label %._crit_edge.loopexit, label %._crit_edge19.preheader.new

._crit_edge19.preheader.new:                      ; preds = %._crit_edge19.prol.loopexit
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19, %._crit_edge19.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge19.preheader.new ], [ %indvars.iv.next.1, %._crit_edge19 ]
  %14 = phi double [ %.unr.ph, %._crit_edge19.preheader.new ], [ %26, %._crit_edge19 ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  store double %20, double* %sunkaddr3, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv.next
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %sunkaddr3, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv15
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge19

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge19
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge19.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa25 = phi double [ %.lcssa25.unr.ph, %._crit_edge19.prol.loopexit ], [ %26, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge._crit_edge
  %.lcssa = phi double [ %5, %._crit_edge._crit_edge ], [ %.lcssa25, %._crit_edge.loopexit ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv15
  %28 = load double, double* %27, align 8
  %29 = fdiv double %.lcssa, %28
  store double %29, double* %sunkaddr3, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond18, label %._crit_edge10, label %._crit_edge._crit_edge

._crit_edge10:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %7 = phi %struct._IO_FILE* [ %16, %._crit_edge ], [ %6, %.lr.ph.preheader ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #6
  %11 = trunc i64 %indvars.iv to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge2, label %.lr.ph

._crit_edge2:                                     ; preds = %._crit_edge
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
