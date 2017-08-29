; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next.4, %._crit_edge ]
  %3 = sub nuw nsw i64 2001, %indvars.iv
  %4 = trunc i64 %3 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %5, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = sub i64 2000, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %9, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %11 = sub i64 1999, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %13, double* %14, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %15 = sub i64 1998, %indvars.iv
  %16 = trunc i64 %15 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %17, double* %18, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %19 = sub i64 1997, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.3
  store double %21, double* %22, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %23, label %._crit_edge

; <label>:23:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %4 = alloca [2000 x double], align 16
  %5 = load double, double* %1, align 8
  %6 = fsub double -0.000000e+00, %5
  store double %6, double* %2, align 8
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  %9 = bitcast [2000 x double]* %4 to i8*
  %10 = bitcast double* %2 to i8*
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12, %3
  %indvars.iv30 = phi i64 [ 1, %3 ], [ %indvars.iv.next31, %._crit_edge12 ]
  %indvar = phi i64 [ 0, %3 ], [ %52, %._crit_edge12 ]
  %.0314 = phi double [ %8, %3 ], [ %59, %._crit_edge12 ]
  %.0413 = phi double [ 1.000000e+00, %3 ], [ %54, %._crit_edge12 ]
  %11 = add i64 %indvar, 1
  %12 = shl i64 %indvar, 3
  %13 = fmul double %.0314, %.0314
  %14 = fsub double 1.000000e+00, %13
  %15 = add nsw i64 %indvars.iv30, -1
  %xtraiter = and i64 %11, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge33.prol.loopexit, label %._crit_edge33.prol.preheader

._crit_edge33.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge33.prol

._crit_edge33.prol:                               ; preds = %._crit_edge33.prol, %._crit_edge33.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge33.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge33.prol ]
  %.025.prol = phi double [ 0.000000e+00, %._crit_edge33.prol.preheader ], [ %22, %._crit_edge33.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge33.prol.preheader ], [ %prol.iter.sub, %._crit_edge33.prol ]
  %16 = sub nsw i64 %15, %indvars.iv.prol
  %17 = getelementptr inbounds double, double* %1, i64 %16
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %.025.prol, %21
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge33.prol.loopexit.unr-lcssa, label %._crit_edge33.prol, !llvm.loop !1

._crit_edge33.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge33.prol
  br label %._crit_edge33.prol.loopexit

._crit_edge33.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge33.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %22, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %22, %._crit_edge33.prol.loopexit.unr-lcssa ]
  %23 = icmp ult i64 %indvar, 3
  br i1 %23, label %.lr.ph9, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge33.prol.loopexit
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge33 ]
  %.025 = phi double [ %.025.unr, %.lr.ph.new ], [ %51, %._crit_edge33 ]
  %24 = sub nsw i64 %15, %indvars.iv
  %25 = getelementptr inbounds double, double* %1, i64 %24
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %.025, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = sub nsw i64 %15, %indvars.iv.next
  %32 = getelementptr inbounds double, double* %1, i64 %31
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %30, %36
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = sub nsw i64 %15, %indvars.iv.next.1
  %39 = getelementptr inbounds double, double* %1, i64 %38
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %37, %43
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %45 = sub nsw i64 %15, %indvars.iv.next.2
  %46 = getelementptr inbounds double, double* %1, i64 %45
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %44, %50
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv30
  br i1 %exitcond.3, label %.lr.ph9.unr-lcssa, label %._crit_edge33

.lr.ph9.unr-lcssa:                                ; preds = %._crit_edge33
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %._crit_edge33.prol.loopexit, %.lr.ph9.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge33.prol.loopexit ], [ %51, %.lr.ph9.unr-lcssa ]
  %52 = add nuw nsw i64 %indvar, 1
  %53 = add nuw nsw i64 %12, 8
  %54 = fmul double %.0413, %14
  %55 = getelementptr inbounds double, double* %1, i64 %indvars.iv30
  %56 = load double, double* %55, align 8
  %57 = fadd double %.lcssa, %56
  %58 = fsub double -0.000000e+00, %57
  %59 = fdiv double %58, %54
  %min.iters.check = icmp ult i64 %52, 4
  br i1 %min.iters.check, label %._crit_edge34.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9
  %n.vec = and i64 %52, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge34.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert40 = insertelement <2 x double> undef, double %59, i32 0
  %broadcast.splat41 = shufflevector <2 x double> %broadcast.splatinsert40, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %60 = getelementptr inbounds double, double* %2, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %63, align 8
  %64 = sub nsw i64 %15, %index
  %65 = getelementptr inbounds double, double* %2, i64 %64
  %66 = getelementptr double, double* %65, i64 -1
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %67, align 8
  %reverse = shufflevector <2 x double> %wide.load37, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %68 = getelementptr double, double* %65, i64 -2
  %69 = getelementptr double, double* %68, i64 -1
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %70, align 8
  %reverse39 = shufflevector <2 x double> %wide.load38, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %71 = fmul <2 x double> %broadcast.splat41, %reverse
  %72 = fmul <2 x double> %broadcast.splat41, %reverse39
  %73 = fadd <2 x double> %wide.load, %71
  %74 = fadd <2 x double> %wide.load36, %72
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  store <2 x double> %73, <2 x double>* %76, align 16
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> %74, <2 x double>* %78, align 16
  %index.next = add i64 %index, 4
  %79 = icmp eq i64 %index.next, %n.vec
  br i1 %79, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %52, %n.vec
  br i1 %cmp.n, label %._crit_edge12, label %._crit_edge34.preheader

._crit_edge34.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9
  %indvars.iv18.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph9 ], [ %n.vec, %middle.block ]
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.preheader, %._crit_edge34
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge34 ], [ %indvars.iv18.ph, %._crit_edge34.preheader ]
  %80 = getelementptr inbounds double, double* %2, i64 %indvars.iv18
  %81 = load double, double* %80, align 8
  %82 = sub nsw i64 %15, %indvars.iv18
  %83 = getelementptr inbounds double, double* %2, i64 %82
  %84 = load double, double* %83, align 8
  %85 = fmul double %59, %84
  %86 = fadd double %81, %85
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv18
  store double %86, double* %87, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next19, %indvars.iv30
  br i1 %exitcond23, label %._crit_edge12.loopexit, label %._crit_edge34, !llvm.loop !6

._crit_edge12.loopexit:                           ; preds = %._crit_edge34
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %10, i8* nonnull %9, i64 %53, i32 8, i1 false)
  %88 = getelementptr inbounds double, double* %2, i64 %indvars.iv30
  store double %59, double* %88, align 8
  %exitcond32 = icmp eq i64 %52, 1999
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br i1 %exitcond32, label %89, label %.lr.ph

; <label>:89:                                     ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %16, label %._crit_edge2

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
