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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(double* %5)
  tail call void (...) @polybench_timer_start() #3
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double*) unnamed_addr #0 {
.lr.ph:
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %._crit_edge7 ]
  %1 = trunc i64 %indvars.iv to i32
  %2 = sub nuw nsw i32 2001, %1
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  store double %3, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = trunc i64 %indvars.iv.next to i32
  %6 = sub nuw nsw i32 2001, %5
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next
  store double %7, double* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %9 = trunc i64 %indvars.iv.next.1 to i32
  %10 = sub nuw nsw i32 2001, %9
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.1
  store double %11, double* %12, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %13 = trunc i64 %indvars.iv.next.2 to i32
  %14 = sub nuw nsw i32 2001, %13
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.2
  store double %15, double* %16, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %17 = trunc i64 %indvars.iv.next.3 to i32
  %18 = sub nuw nsw i32 2001, %17
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %0, i64 %indvars.iv.next.3
  store double %19, double* %20, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %._crit_edge, label %._crit_edge7

._crit_edge:                                      ; preds = %._crit_edge7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_durbin(double*, double*) unnamed_addr #0 {
.lr.ph56.preheader:
  %2 = bitcast double* %1 to i8*
  %3 = alloca [2000 x double], align 16
  %4 = bitcast [2000 x double]* %3 to i8*
  %5 = load double, double* %0, align 8
  %6 = fsub double -0.000000e+00, %5
  store double %6, double* %1, align 8
  %7 = load double, double* %0, align 8
  %8 = fsub double -0.000000e+00, %7
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge51, %.lr.ph56.preheader
  %indvars.iv72 = phi i64 [ 1, %.lr.ph56.preheader ], [ %indvars.iv.next73, %._crit_edge51 ]
  %indvar = phi i64 [ 0, %.lr.ph56.preheader ], [ %10, %._crit_edge51 ]
  %.04253 = phi double [ 1.000000e+00, %.lr.ph56.preheader ], [ %51, %._crit_edge51 ]
  %.04352 = phi double [ %8, %.lr.ph56.preheader ], [ %56, %._crit_edge51 ]
  %9 = add i64 %indvar, 1
  %10 = add nuw nsw i64 %indvar, 1
  %11 = fmul double %.04352, %.04352
  %12 = add nsw i64 %indvars.iv72, -1
  %xtraiter = and i64 %9, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge76.prol.loopexit, label %._crit_edge76.prol.preheader

._crit_edge76.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge76.prol

._crit_edge76.prol:                               ; preds = %._crit_edge76.prol, %._crit_edge76.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge76.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge76.prol ]
  %.04144.prol = phi double [ 0.000000e+00, %._crit_edge76.prol.preheader ], [ %19, %._crit_edge76.prol ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge76.prol.preheader ], [ %prol.iter.sub, %._crit_edge76.prol ]
  %13 = sub nsw i64 %12, %indvars.iv.prol
  %14 = getelementptr inbounds double, double* %0, i64 %13
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %.04144.prol, %18
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge76.prol.loopexit.unr-lcssa, label %._crit_edge76.prol, !llvm.loop !1

._crit_edge76.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge76.prol
  br label %._crit_edge76.prol.loopexit

._crit_edge76.prol.loopexit:                      ; preds = %.lr.ph, %._crit_edge76.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %19, %._crit_edge76.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %._crit_edge76.prol.loopexit.unr-lcssa ]
  %.04144.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %19, %._crit_edge76.prol.loopexit.unr-lcssa ]
  %20 = icmp ult i64 %indvar, 3
  br i1 %20, label %.lr.ph48, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge76.prol.loopexit
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge76 ]
  %.04144 = phi double [ %.04144.unr, %.lr.ph.new ], [ %48, %._crit_edge76 ]
  %21 = sub nsw i64 %12, %indvars.iv
  %22 = getelementptr inbounds double, double* %0, i64 %21
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %.04144, %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = sub nsw i64 %12, %indvars.iv.next
  %29 = getelementptr inbounds double, double* %0, i64 %28
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %27, %33
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %35 = sub nsw i64 %12, %indvars.iv.next.1
  %36 = getelementptr inbounds double, double* %0, i64 %35
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %34, %40
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %42 = sub nsw i64 %12, %indvars.iv.next.2
  %43 = getelementptr inbounds double, double* %0, i64 %42
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %41, %47
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv72
  br i1 %exitcond.3, label %.lr.ph48.unr-lcssa, label %._crit_edge76

.lr.ph48.unr-lcssa:                               ; preds = %._crit_edge76
  br label %.lr.ph48

.lr.ph48:                                         ; preds = %._crit_edge76.prol.loopexit, %.lr.ph48.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge76.prol.loopexit ], [ %48, %.lr.ph48.unr-lcssa ]
  %49 = shl i64 %indvar, 3
  %50 = fsub double 1.000000e+00, %11
  %51 = fmul double %.04253, %50
  %52 = getelementptr inbounds double, double* %0, i64 %indvars.iv72
  %53 = load double, double* %52, align 8
  %54 = fadd double %.lcssa, %53
  %55 = fsub double -0.000000e+00, %54
  %56 = fdiv double %55, %51
  %min.iters.check = icmp ult i64 %10, 4
  br i1 %min.iters.check, label %._crit_edge77.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph48
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %._crit_edge77.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert6 = insertelement <2 x double> undef, double %56, i32 0
  %broadcast.splat7 = shufflevector <2 x double> %broadcast.splatinsert6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %57 = getelementptr inbounds double, double* %1, i64 %index
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %58, align 8
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load2 = load <2 x double>, <2 x double>* %60, align 8
  %61 = sub nsw i64 %12, %index
  %62 = getelementptr inbounds double, double* %1, i64 %61
  %63 = getelementptr double, double* %62, i64 -1
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load3 = load <2 x double>, <2 x double>* %64, align 8
  %reverse = shufflevector <2 x double> %wide.load3, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %65 = getelementptr double, double* %62, i64 -2
  %66 = getelementptr double, double* %65, i64 -1
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load4 = load <2 x double>, <2 x double>* %67, align 8
  %reverse5 = shufflevector <2 x double> %wide.load4, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %68 = fmul <2 x double> %broadcast.splat7, %reverse
  %69 = fmul <2 x double> %broadcast.splat7, %reverse5
  %70 = fadd <2 x double> %wide.load, %68
  %71 = fadd <2 x double> %wide.load2, %69
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %index
  %73 = bitcast double* %72 to <2 x double>*
  store <2 x double> %70, <2 x double>* %73, align 16
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  store <2 x double> %71, <2 x double>* %75, align 16
  %index.next = add i64 %index, 4
  %76 = icmp eq i64 %index.next, %n.vec
  br i1 %76, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %10, %n.vec
  br i1 %cmp.n, label %._crit_edge51, label %._crit_edge77.preheader

._crit_edge77.preheader:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph48
  %indvars.iv60.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.lr.ph48 ], [ %n.vec, %middle.block ]
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.preheader, %._crit_edge77
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge77 ], [ %indvars.iv60.ph, %._crit_edge77.preheader ]
  %77 = getelementptr inbounds double, double* %1, i64 %indvars.iv60
  %78 = load double, double* %77, align 8
  %79 = sub nsw i64 %12, %indvars.iv60
  %80 = getelementptr inbounds double, double* %1, i64 %79
  %81 = load double, double* %80, align 8
  %82 = fmul double %56, %81
  %83 = fadd double %78, %82
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv60
  store double %83, double* %84, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next61, %indvars.iv72
  br i1 %exitcond65, label %._crit_edge51.loopexit, label %._crit_edge77, !llvm.loop !6

._crit_edge51.loopexit:                           ; preds = %._crit_edge77
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %middle.block
  %85 = add nuw nsw i64 %49, 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %2, i8* nonnull %4, i64 %85, i32 8, i1 false)
  %86 = getelementptr inbounds double, double* %1, i64 %indvars.iv72
  store double %56, double* %86, align 8
  %exitcond75 = icmp eq i64 %10, 1999
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  br i1 %exitcond75, label %._crit_edge57, label %.lr.ph

._crit_edge57:                                    ; preds = %._crit_edge51
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double*) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
