; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call void @kernel_durbin(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call void @print_array(i32 2000, double* %6)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double*) #2 {
  br i1 true, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  br i1 true, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %3 = trunc i64 %indvars.iv.prol to i32
  %4 = sub i32 2001, %3
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %5, double* %6, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 false, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub i32 2001, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %9, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = sub i32 2001, %11
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %13, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = trunc i64 %indvars.iv.next.1 to i32
  %16 = sub i32 2001, %15
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %17, double* %18, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = trunc i64 %indvars.iv.next.2 to i32
  %20 = sub i32 2001, %19
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %21, double* %22, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_durbin(i32, double*, double*) #2 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  br i1 true, label %.lr.ph20.preheader, label %._crit_edge21

.lr.ph20.preheader:                               ; preds = %3
  %9 = load double, double* %1, align 8
  %10 = fsub double -0.000000e+00, %9
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph20.preheader, %._crit_edge17
  %12 = phi double [ %8, %.lr.ph20.preheader ], [ %65, %._crit_edge17 ]
  %indvars.iv44 = phi i64 [ 1, %.lr.ph20.preheader ], [ %indvars.iv.next45, %._crit_edge17 ]
  %indvar42 = phi i64 [ 0, %.lr.ph20.preheader ], [ %indvar.next43, %._crit_edge17 ]
  %indvar = phi i32 [ 0, %.lr.ph20.preheader ], [ %21, %._crit_edge17 ]
  %13 = phi double [ %10, %.lr.ph20.preheader ], [ %65, %._crit_edge17 ]
  %14 = phi double [ 1.000000e+00, %.lr.ph20.preheader ], [ %20, %._crit_edge17 ]
  %15 = add i64 %indvar42, -1
  %16 = shl i64 %indvar42, 3
  %17 = add nuw nsw i64 %16, 8
  %18 = fmul double %13, %13
  %19 = fsub double 1.000000e+00, %18
  %20 = fmul double %14, %19
  %21 = add nuw nsw i32 %indvar, 1
  %22 = add nsw i64 %indvars.iv44, -1
  %xtraiter = and i32 %21, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %23 = phi double [ %30, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %24 = sub nsw i64 %22, %indvars.iv.prol
  %25 = getelementptr inbounds double, double* %1, i64 %24
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %23, %29
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %30, %.prol.loopexit.loopexit ]
  %.lcssa24.unr = phi double [ undef, %.lr.ph ], [ %30, %.prol.loopexit.loopexit ]
  %31 = icmp ult i32 %indvar, 3
  br i1 %31, label %.lr.ph13, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %32 = phi double [ %60, %.lr.ph.new ], [ %.unr, %.lr.ph.new.preheader ]
  %33 = sub nsw i64 %22, %indvars.iv
  %34 = getelementptr inbounds double, double* %1, i64 %33
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %32, %38
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = sub nsw i64 %22, %indvars.iv.next
  %41 = getelementptr inbounds double, double* %1, i64 %40
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %39, %45
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %47 = sub nsw i64 %22, %indvars.iv.next.1
  %48 = getelementptr inbounds double, double* %1, i64 %47
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %46, %52
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %54 = sub nsw i64 %22, %indvars.iv.next.2
  %55 = getelementptr inbounds double, double* %1, i64 %54
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %53, %59
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv44
  br i1 %exitcond.3, label %.lr.ph13.loopexit, label %.lr.ph.new

.lr.ph13.loopexit:                                ; preds = %.lr.ph.new
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13.loopexit, %.prol.loopexit
  %.lcssa24 = phi double [ %.lcssa24.unr, %.prol.loopexit ], [ %60, %.lr.ph13.loopexit ]
  %61 = getelementptr inbounds double, double* %1, i64 %indvars.iv44
  %62 = load double, double* %61, align 8
  %63 = fadd double %.lcssa24, %62
  %64 = fsub double -0.000000e+00, %63
  %65 = fdiv double %64, %20
  %66 = and i32 %indvar, 1
  %lcmp.mod35 = icmp eq i32 %66, 0
  br i1 %lcmp.mod35, label %.prol.preheader32, label %.prol.loopexit33

.prol.preheader32:                                ; preds = %.lr.ph13
  %67 = load double, double* %2, align 8
  %68 = fmul double %65, %12
  %69 = fadd double %67, %68
  store double %69, double* %11, align 16
  br label %.prol.loopexit33

.prol.loopexit33:                                 ; preds = %.prol.preheader32, %.lr.ph13
  %indvars.iv27.unr.ph = phi i64 [ 1, %.prol.preheader32 ], [ 0, %.lr.ph13 ]
  %70 = icmp eq i32 %indvar, 0
  br i1 %70, label %._crit_edge17, label %.lr.ph13.new.preheader

.lr.ph13.new.preheader:                           ; preds = %.prol.loopexit33
  %71 = sub i64 %15, %indvars.iv27.unr.ph
  %72 = lshr i64 %71, 1
  %73 = add nuw i64 %72, 1
  %min.iters.check = icmp ult i64 %73, 2
  br i1 %min.iters.check, label %.lr.ph13.new.preheader56, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph13.new.preheader
  %n.mod.vf = and i64 %73, 1
  %n.vec = sub i64 %73, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %74 = or i64 %indvars.iv27.unr.ph, 2
  %75 = shl nuw i64 %72, 1
  %76 = add i64 %74, %75
  %77 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %76, %77
  br i1 %cmp.zero, label %.lr.ph13.new.preheader56, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert54 = insertelement <2 x double> undef, double %65, i32 0
  %broadcast.splat55 = shufflevector <2 x double> %broadcast.splatinsert54, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %78 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv27.unr.ph, %78
  %79 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %80 = bitcast double* %79 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %80, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec49 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %81 = sub nsw i64 %22, %offset.idx
  %82 = getelementptr inbounds double, double* %2, i64 %81
  %83 = getelementptr double, double* %82, i64 -3
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec50 = load <4 x double>, <4 x double>* %84, align 8
  %strided.vec51 = shufflevector <4 x double> %wide.vec50, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec51, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec52 = shufflevector <4 x double> %wide.vec50, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse53 = shufflevector <2 x double> %strided.vec52, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %85 = fmul <2 x double> %broadcast.splat55, %reverse53
  %86 = fadd <2 x double> %strided.vec, %85
  %87 = add nuw nsw i64 %offset.idx, 1
  %88 = fmul <2 x double> %broadcast.splat55, %reverse
  %89 = fadd <2 x double> %strided.vec49, %88
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %87
  %91 = getelementptr double, double* %90, i64 -1
  %92 = bitcast double* %91 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %86, <2 x double> %89, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %92, align 8
  %index.next = add i64 %index, 2
  %93 = icmp eq i64 %index.next, %n.vec
  br i1 %93, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge17, label %.lr.ph13.new.preheader56

.lr.ph13.new.preheader56:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph13.new.preheader
  %indvars.iv27.ph = phi i64 [ %indvars.iv27.unr.ph, %min.iters.checked ], [ %indvars.iv27.unr.ph, %.lr.ph13.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph13.new

.lr.ph13.new:                                     ; preds = %.lr.ph13.new.preheader56, %.lr.ph13.new
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %.lr.ph13.new ], [ %indvars.iv27.ph, %.lr.ph13.new.preheader56 ]
  %94 = getelementptr inbounds double, double* %2, i64 %indvars.iv27
  %95 = load double, double* %94, align 8
  %96 = sub nsw i64 %22, %indvars.iv27
  %97 = getelementptr inbounds double, double* %2, i64 %96
  %98 = load double, double* %97, align 8
  %99 = fmul double %65, %98
  %100 = fadd double %95, %99
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv27
  store double %100, double* %101, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %102 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next28
  %103 = load double, double* %102, align 8
  %104 = sub nsw i64 %22, %indvars.iv.next28
  %105 = getelementptr inbounds double, double* %2, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fmul double %65, %106
  %108 = fadd double %103, %107
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next28
  store double %108, double* %109, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv44
  br i1 %exitcond.1, label %._crit_edge17.loopexit, label %.lr.ph13.new, !llvm.loop !7

._crit_edge17.loopexit:                           ; preds = %.lr.ph13.new
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %middle.block, %.prol.loopexit33
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %6, i64 %17, i32 8, i1 false)
  %110 = getelementptr inbounds double, double* %2, i64 %indvars.iv44
  store double %65, double* %110, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %indvar.next43 = add nuw nsw i64 %indvar42, 1
  %exitcond = icmp eq i64 %indvar.next43, 1999
  br i1 %exitcond, label %._crit_edge21.loopexit, label %.lr.ph

._crit_edge21.loopexit:                           ; preds = %._crit_edge17
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %3
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %12
  %indvars.iv = phi i64 [ %indvars.iv.next, %12 ], [ 0, %.lr.ph.preheader ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %.lr.ph
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %.lr.ph, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %12
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
