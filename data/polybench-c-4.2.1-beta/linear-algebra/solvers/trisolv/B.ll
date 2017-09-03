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
.lr.ph5:
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph5
  %indvars.iv10 = phi i64 [ 0, %.lr.ph5 ], [ %4, %._crit_edge ]
  %4 = add i64 %indvars.iv10, 1
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  store double -9.990000e+02, double* %5, align 8
  %6 = trunc i64 %indvars.iv10 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv10
  store double %7, double* %8, align 8
  %9 = add i32 %6, 2001
  %xtraiter = and i64 %4, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 2.000000e+00
  %12 = fdiv double %11, 2.000000e+03
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 0
  store double %12, double* %13, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %14 = icmp eq i64 %indvars.iv10, 0
  br i1 %14, label %._crit_edge, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit.unr-lcssa
  br label %15

; <label>:15:                                     ; preds = %15, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %15 ]
  %16 = trunc i64 %indvars.iv to i32
  %17 = sub i32 %9, %16
  %18 = sitofp i32 %17 to double
  %19 = fmul double %18, 2.000000e+00
  %20 = fdiv double %19, 2.000000e+03
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %22 = trunc i64 %indvars.iv.next to i32
  %23 = sub i32 %9, %22
  %24 = sitofp i32 %23 to double
  %25 = fmul double %24, 2.000000e+00
  %26 = fdiv double %25, 2.000000e+03
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv.next
  store double %26, double* %27, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv10
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.unr-lcssa, label %15

._crit_edge.unr-lcssa:                            ; preds = %15
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.unr-lcssa, %._crit_edge.unr-lcssa
  %exitcond12 = icmp eq i64 %4, 2000
  br i1 %exitcond12, label %._crit_edge6, label %.lr.ph

._crit_edge6:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double* nocapture, double* nocapture readonly) unnamed_addr #2 {
.lr.ph5.preheader:
  %sunkaddr14 = ptrtoint double* %2 to i64
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %._crit_edge, %.lr.ph5.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge ], [ 0, %.lr.ph5.preheader ]
  %indvars.iv7 = phi i32 [ %indvars.iv.next8, %._crit_edge ], [ -1, %.lr.ph5.preheader ]
  %4 = add i64 %indvars.iv9, 4294967295
  %5 = and i64 %4, 4294967295
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv9
  %7 = bitcast double* %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = getelementptr inbounds double, double* %2, i64 %indvars.iv9
  %10 = bitcast double* %9 to i64*
  store i64 %8, i64* %10, align 8
  %11 = icmp sgt i64 %indvars.iv9, 0
  br i1 %11, label %.lr.ph.preheader, label %.lr.ph5.._crit_edge_crit_edge

.lr.ph5.._crit_edge_crit_edge:                    ; preds = %.lr.ph5
  %.pre19 = shl i64 %indvars.iv9, 3
  %.pre20 = add i64 %sunkaddr14, %.pre19
  %.pre21 = inttoptr i64 %.pre20 to double*
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph5
  %sunkaddr11 = shl i64 %indvars.iv9, 3
  %sunkaddr12 = add i64 %sunkaddr14, %sunkaddr11
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to double*
  %wide.trip.count = zext i32 %indvars.iv7 to i64
  %12 = and i64 %4, 1
  %lcmp.mod = icmp eq i64 %12, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 0
  %14 = load double, double* %13, align 8
  %15 = load double, double* %2, align 8
  %16 = fmul double %14, %15
  %17 = load double, double* %sunkaddr13, align 8
  %18 = fsub double %17, %16
  store double %18, double* %sunkaddr13, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol.preheader ], [ 0, %.lr.ph.preheader ]
  %19 = icmp eq i64 %5, 0
  br i1 %19, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %.pre = load double, double* %sunkaddr13, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %20 = phi double [ %.pre, %.lr.ph.preheader.new ], [ %32, %.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %sunkaddr13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %sunkaddr13, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph5.._crit_edge_crit_edge, %._crit_edge.loopexit
  %sunkaddr17.pre-phi = phi double* [ %.pre21, %.lr.ph5.._crit_edge_crit_edge ], [ %sunkaddr13, %._crit_edge.loopexit ]
  %33 = load double, double* %sunkaddr17.pre-phi, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv9
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %sunkaddr17.pre-phi, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %indvars.iv.next8 = add nsw i32 %indvars.iv7, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond18, label %._crit_edge6, label %.lr.ph5

._crit_edge6:                                     ; preds = %._crit_edge
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
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %7 = phi %struct._IO_FILE* [ %6, %.lr.ph.preheader ], [ %16, %.lr.ph._crit_edge ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %9) #5
  %11 = trunc i64 %indvars.iv to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.lr.ph._crit_edge

; <label>:14:                                     ; preds = %.lr.ph
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %14
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
