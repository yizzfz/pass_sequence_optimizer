; ModuleID = 'A.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  %6 = add nsw i32 %xtraiter, -1
  %7 = zext i32 %6 to i64
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %8 = trunc i64 %indvars.iv.prol to i32
  %9 = sub i32 %4, %8
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %10, double* %11, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %12 = add nuw nsw i64 %7, 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %12, %.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %5, 3
  br i1 %13, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %14 = trunc i64 %indvars.iv to i32
  %15 = sub i32 %4, %14
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %16, double* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = trunc i64 %indvars.iv.next to i32
  %19 = sub i32 %4, %18
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %20, double* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %22 = trunc i64 %indvars.iv.next.1 to i32
  %23 = sub i32 %4, %22
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %24, double* %25, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %26 = trunc i64 %indvars.iv.next.2 to i32
  %27 = sub i32 %4, %26
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %28, double* %29, align 8
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
  %indvars.iv45 = phi i2 [ 1, %.lr.ph17.preheader ], [ %indvars.iv.next46, %._crit_edge12 ]
  %indvars.iv38 = phi i64 [ 1, %.lr.ph17.preheader ], [ %indvars.iv.next39, %._crit_edge12 ]
  %indvar36 = phi i64 [ 0, %.lr.ph17.preheader ], [ %indvar.next37, %._crit_edge12 ]
  %indvar = phi i32 [ 0, %.lr.ph17.preheader ], [ %indvar.next, %._crit_edge12 ]
  %.0314 = phi double [ %11, %.lr.ph17.preheader ], [ %66, %._crit_edge12 ]
  %.0413 = phi double [ 1.000000e+00, %.lr.ph17.preheader ], [ %23, %._crit_edge12 ]
  %14 = add i64 %indvar36, -1
  %15 = zext i2 %indvars.iv45 to i64
  %16 = add nuw nsw i64 %15, 4294967295
  %17 = and i64 %16, 4294967295
  %18 = add nuw nsw i64 %17, 1
  %19 = shl i64 %indvar36, 3
  %20 = add nuw nsw i64 %19, 8
  %21 = fmul double %.0314, %.0314
  %22 = fsub double 1.000000e+00, %21
  %23 = fmul double %.0413, %22
  %24 = add nuw nsw i32 %indvar, 1
  %25 = add nsw i64 %indvars.iv38, -1
  %xtraiter = and i32 %24, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.025.prol = phi double [ %32, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %26 = sub nsw i64 %25, %indvars.iv.prol
  %27 = getelementptr inbounds double, double* %1, i64 %26
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %.025.prol, %31
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %18, %.prol.loopexit.loopexit ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %32, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %32, %.prol.loopexit.loopexit ]
  %33 = icmp ult i32 %indvar, 3
  br i1 %33, label %.lr.ph9, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.025 = phi double [ %61, %.lr.ph.new ], [ %.025.unr, %.lr.ph.new.preheader ]
  %34 = sub nsw i64 %25, %indvars.iv
  %35 = getelementptr inbounds double, double* %1, i64 %34
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %.025, %39
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = sub nsw i64 %25, %indvars.iv.next
  %42 = getelementptr inbounds double, double* %1, i64 %41
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %40, %46
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %48 = sub nsw i64 %25, %indvars.iv.next.1
  %49 = getelementptr inbounds double, double* %1, i64 %48
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %47, %53
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %55 = sub nsw i64 %25, %indvars.iv.next.2
  %56 = getelementptr inbounds double, double* %1, i64 %55
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %54, %60
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv38
  br i1 %exitcond.3, label %.lr.ph9.loopexit, label %.lr.ph.new

.lr.ph9.loopexit:                                 ; preds = %.lr.ph.new
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %61, %.lr.ph9.loopexit ]
  %62 = getelementptr inbounds double, double* %1, i64 %indvars.iv38
  %63 = load double, double* %62, align 8
  %64 = fadd double %.lcssa, %63
  %65 = fsub double -0.000000e+00, %64
  %66 = fdiv double %65, %23
  %67 = add nsw i64 %indvars.iv38, -1
  %68 = and i32 %indvar, 1
  %lcmp.mod29 = icmp eq i32 %68, 0
  br i1 %lcmp.mod29, label %.prol.preheader26, label %.prol.loopexit27

.prol.preheader26:                                ; preds = %.lr.ph9
  %69 = load double, double* %2, align 8
  %70 = getelementptr inbounds double, double* %2, i64 %67
  %71 = load double, double* %70, align 8
  %72 = fmul double %66, %71
  %73 = fadd double %69, %72
  store double %73, double* %13, align 16
  br label %.prol.loopexit27

.prol.loopexit27:                                 ; preds = %.prol.preheader26, %.lr.ph9
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader26 ], [ 0, %.lr.ph9 ]
  %74 = icmp eq i32 %indvar, 0
  br i1 %74, label %._crit_edge12, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit27
  %75 = sub i64 %14, %indvars.iv21.unr.ph
  %76 = lshr i64 %75, 1
  %77 = add nuw i64 %76, 1
  %min.iters.check = icmp ult i64 %77, 2
  br i1 %min.iters.check, label %.lr.ph9.new.preheader54, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9.new.preheader
  %n.mod.vf = and i64 %77, 1
  %n.vec = sub i64 %77, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %78 = or i64 %indvars.iv21.unr.ph, 2
  %79 = shl nuw i64 %76, 1
  %80 = add i64 %78, %79
  %81 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %80, %81
  br i1 %cmp.zero, label %.lr.ph9.new.preheader54, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert52 = insertelement <2 x double> undef, double %66, i32 0
  %broadcast.splat53 = shufflevector <2 x double> %broadcast.splatinsert52, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %82 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv21.unr.ph, %82
  %83 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %84, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec47 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = sub nsw i64 %67, %offset.idx
  %86 = getelementptr inbounds double, double* %2, i64 %85
  %87 = getelementptr double, double* %86, i64 -3
  %88 = bitcast double* %87 to <4 x double>*
  %wide.vec48 = load <4 x double>, <4 x double>* %88, align 8
  %strided.vec49 = shufflevector <4 x double> %wide.vec48, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec49, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec50 = shufflevector <4 x double> %wide.vec48, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse51 = shufflevector <2 x double> %strided.vec50, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %89 = fmul <2 x double> %broadcast.splat53, %reverse51
  %90 = fadd <2 x double> %strided.vec, %89
  %91 = add nuw nsw i64 %offset.idx, 1
  %92 = fmul <2 x double> %broadcast.splat53, %reverse
  %93 = fadd <2 x double> %strided.vec47, %92
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %91
  %95 = getelementptr double, double* %94, i64 -1
  %96 = bitcast double* %95 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %90, <2 x double> %93, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %96, align 8
  %index.next = add i64 %index, 2
  %97 = icmp eq i64 %index.next, %n.vec
  br i1 %97, label %middle.block, label %vector.body, !llvm.loop !4

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge12, label %.lr.ph9.new.preheader54

.lr.ph9.new.preheader54:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9.new.preheader
  %indvars.iv21.ph = phi i64 [ %indvars.iv21.unr.ph, %min.iters.checked ], [ %indvars.iv21.unr.ph, %.lr.ph9.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader54, %.lr.ph9.new
  %indvars.iv21 = phi i64 [ %indvars.iv.next22.1, %.lr.ph9.new ], [ %indvars.iv21.ph, %.lr.ph9.new.preheader54 ]
  %98 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %99 = load double, double* %98, align 8
  %100 = sub nsw i64 %67, %indvars.iv21
  %101 = getelementptr inbounds double, double* %2, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fmul double %66, %102
  %104 = fadd double %99, %103
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv21
  store double %104, double* %105, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %106 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next22
  %107 = load double, double* %106, align 8
  %108 = sub nsw i64 %67, %indvars.iv.next22
  %109 = getelementptr inbounds double, double* %2, i64 %108
  %110 = load double, double* %109, align 8
  %111 = fmul double %66, %110
  %112 = fadd double %107, %111
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next22
  store double %112, double* %113, align 8
  %indvars.iv.next22.1 = add nuw nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next22.1, %indvars.iv38
  br i1 %exitcond.1, label %._crit_edge12.loopexit, label %.lr.ph9.new, !llvm.loop !7

._crit_edge12.loopexit:                           ; preds = %.lr.ph9.new
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %middle.block, %.prol.loopexit27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %6, i64 %20, i32 8, i1 false)
  %114 = getelementptr inbounds double, double* %2, i64 %indvars.iv38
  store double %66, double* %114, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvar.next37 = add nuw nsw i64 %indvar36, 1
  %exitcond = icmp eq i64 %indvar.next37, %wide.trip.count40
  %indvars.iv.next46 = add i2 %indvars.iv45, 1
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

; <label>:13:                                     ; preds = %.lr.ph, %11
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
