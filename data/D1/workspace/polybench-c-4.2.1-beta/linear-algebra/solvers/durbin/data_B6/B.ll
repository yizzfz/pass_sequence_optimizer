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
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %4 = add nsw i32 %0, 1
  %5 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %6 = trunc i64 %indvars.iv.prol to i32
  %7 = sub i32 %4, %6
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %8, double* %9, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %10 = icmp ult i32 %5, 3
  br i1 %10, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %11 = trunc i64 %indvars.iv to i32
  %12 = sub i32 %4, %11
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %13, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sub i32 %4, %15
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %19 = trunc i64 %indvars.iv.next.1 to i32
  %20 = sub i32 %4, %19
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %21, double* %22, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %23 = trunc i64 %indvars.iv.next.2 to i32
  %24 = sub i32 %4, %23
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %25, double* %26, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = icmp sgt i32 %0, 1
  br i1 %9, label %.lr.ph17.preheader, label %._crit_edge18

.lr.ph17.preheader:                               ; preds = %3
  %10 = load double, double* %1, align 8
  %11 = fsub double -0.000000e+00, %10
  %12 = add i32 %0, -1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  %wide.trip.count40 = zext i32 %12 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph17.preheader, %._crit_edge12
  %14 = phi double [ %8, %.lr.ph17.preheader ], [ %63, %._crit_edge12 ]
  %indvars.iv38 = phi i64 [ 1, %.lr.ph17.preheader ], [ %indvars.iv.next39, %._crit_edge12 ]
  %indvar36 = phi i64 [ 0, %.lr.ph17.preheader ], [ %indvar.next37, %._crit_edge12 ]
  %indvar = phi i32 [ 0, %.lr.ph17.preheader ], [ %21, %._crit_edge12 ]
  %.0314 = phi double [ %11, %.lr.ph17.preheader ], [ %63, %._crit_edge12 ]
  %.0413 = phi double [ 1.000000e+00, %.lr.ph17.preheader ], [ %20, %._crit_edge12 ]
  %15 = add i64 %indvar36, -1
  %16 = shl i64 %indvar36, 3
  %17 = add nuw nsw i64 %16, 8
  %18 = fmul double %.0314, %.0314
  %19 = fsub double 1.000000e+00, %18
  %20 = fmul double %.0413, %19
  %21 = add nuw nsw i32 %indvar, 1
  %22 = add nsw i64 %indvars.iv38, -1
  %xtraiter = and i32 %21, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.025.prol = phi double [ %29, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %23 = sub nsw i64 %22, %indvars.iv.prol
  %24 = getelementptr inbounds double, double* %1, i64 %23
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %.025.prol, %28
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %30 = icmp ult i32 %indvar, 3
  br i1 %30, label %.lr.ph9, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.025 = phi double [ %58, %.lr.ph.new ], [ %.025.unr, %.lr.ph.new.preheader ]
  %31 = sub nsw i64 %22, %indvars.iv
  %32 = getelementptr inbounds double, double* %1, i64 %31
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %.025, %36
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %38 = sub nsw i64 %22, %indvars.iv.next
  %39 = getelementptr inbounds double, double* %1, i64 %38
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %37, %43
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %45 = sub nsw i64 %22, %indvars.iv.next.1
  %46 = getelementptr inbounds double, double* %1, i64 %45
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %44, %50
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %52 = sub nsw i64 %22, %indvars.iv.next.2
  %53 = getelementptr inbounds double, double* %1, i64 %52
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %51, %57
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv38
  br i1 %exitcond.3, label %.lr.ph9.loopexit, label %.lr.ph.new

.lr.ph9.loopexit:                                 ; preds = %.lr.ph.new
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %58, %.lr.ph9.loopexit ]
  %59 = getelementptr inbounds double, double* %1, i64 %indvars.iv38
  %60 = load double, double* %59, align 8
  %61 = fadd double %.lcssa, %60
  %62 = fsub double -0.000000e+00, %61
  %63 = fdiv double %62, %20
  %64 = and i32 %indvar, 1
  %lcmp.mod29 = icmp eq i32 %64, 0
  br i1 %lcmp.mod29, label %.prol.preheader26, label %.prol.loopexit27

.prol.preheader26:                                ; preds = %.lr.ph9
  %65 = load double, double* %2, align 8
  %66 = fmul double %63, %14
  %67 = fadd double %65, %66
  store double %67, double* %13, align 16
  br label %.prol.loopexit27

.prol.loopexit27:                                 ; preds = %.prol.preheader26, %.lr.ph9
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader26 ], [ 0, %.lr.ph9 ]
  %68 = icmp eq i32 %indvar, 0
  br i1 %68, label %._crit_edge12, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit27
  %69 = sub i64 %15, %indvars.iv21.unr.ph
  %70 = lshr i64 %69, 1
  %71 = add nuw i64 %70, 1
  %min.iters.check = icmp ult i64 %71, 2
  br i1 %min.iters.check, label %.lr.ph9.new.preheader52, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9.new.preheader
  %n.mod.vf = and i64 %71, 1
  %n.vec = sub i64 %71, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %72 = or i64 %indvars.iv21.unr.ph, 2
  %73 = shl nuw i64 %70, 1
  %74 = add i64 %72, %73
  %75 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %74, %75
  br i1 %cmp.zero, label %.lr.ph9.new.preheader52, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert50 = insertelement <2 x double> undef, double %63, i32 0
  %broadcast.splat51 = shufflevector <2 x double> %broadcast.splatinsert50, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %76 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv21.unr.ph, %76
  %77 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %78 = bitcast double* %77 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %78, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec45 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %79 = sub nsw i64 %22, %offset.idx
  %80 = getelementptr inbounds double, double* %2, i64 %79
  %81 = getelementptr double, double* %80, i64 -3
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec46 = load <4 x double>, <4 x double>* %82, align 8
  %strided.vec47 = shufflevector <4 x double> %wide.vec46, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec47, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec48 = shufflevector <4 x double> %wide.vec46, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse49 = shufflevector <2 x double> %strided.vec48, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %83 = fmul <2 x double> %broadcast.splat51, %reverse49
  %84 = fadd <2 x double> %strided.vec, %83
  %85 = add nuw nsw i64 %offset.idx, 1
  %86 = fmul <2 x double> %broadcast.splat51, %reverse
  %87 = fadd <2 x double> %strided.vec45, %86
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %85
  %89 = getelementptr double, double* %88, i64 -1
  %90 = bitcast double* %89 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %84, <2 x double> %87, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %90, align 8
  %index.next = add i64 %index, 2
  %91 = icmp eq i64 %index.next, %n.vec
  br i1 %91, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge12, label %.lr.ph9.new.preheader52

.lr.ph9.new.preheader52:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9.new.preheader
  %indvars.iv21.ph = phi i64 [ %indvars.iv21.unr.ph, %min.iters.checked ], [ %indvars.iv21.unr.ph, %.lr.ph9.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader52, %.lr.ph9.new
  %indvars.iv21 = phi i64 [ %indvars.iv.next22.1, %.lr.ph9.new ], [ %indvars.iv21.ph, %.lr.ph9.new.preheader52 ]
  %92 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %93 = load double, double* %92, align 8
  %94 = sub nsw i64 %22, %indvars.iv21
  %95 = getelementptr inbounds double, double* %2, i64 %94
  %96 = load double, double* %95, align 8
  %97 = fmul double %63, %96
  %98 = fadd double %93, %97
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv21
  store double %98, double* %99, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %100 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next22
  %101 = load double, double* %100, align 8
  %102 = sub nsw i64 %22, %indvars.iv.next22
  %103 = getelementptr inbounds double, double* %2, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fmul double %63, %104
  %106 = fadd double %101, %105
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next22
  store double %106, double* %107, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next22.1, %indvars.iv38
  br i1 %exitcond.1, label %._crit_edge12.loopexit, label %.lr.ph9.new, !llvm.loop !7

._crit_edge12.loopexit:                           ; preds = %.lr.ph9.new
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %middle.block, %.prol.loopexit27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %6, i64 %17, i32 8, i1 false)
  %108 = getelementptr inbounds double, double* %2, i64 %indvars.iv38
  store double %63, double* %108, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %indvar.next37 = add nuw nsw i64 %indvar36, 1
  %exitcond = icmp eq i64 %indvar.next37, %wide.trip.count40
  br i1 %exitcond, label %._crit_edge18.loopexit, label %.lr.ph

._crit_edge18.loopexit:                           ; preds = %._crit_edge12
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %3
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
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %13
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
