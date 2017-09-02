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
  %indvars.iv38 = phi i64 [ 1, %.lr.ph17.preheader ], [ %indvars.iv.next39, %._crit_edge12 ]
  %indvar36 = phi i64 [ 0, %.lr.ph17.preheader ], [ %indvar.next37, %._crit_edge12 ]
  %indvar = phi i32 [ 0, %.lr.ph17.preheader ], [ %indvar.next, %._crit_edge12 ]
  %.0314 = phi double [ %11, %.lr.ph17.preheader ], [ %62, %._crit_edge12 ]
  %.0413 = phi double [ 1.000000e+00, %.lr.ph17.preheader ], [ %19, %._crit_edge12 ]
  %14 = add i64 %indvar36, -1
  %15 = shl i64 %indvar36, 3
  %16 = add nuw nsw i64 %15, 8
  %17 = fmul double %.0314, %.0314
  %18 = fsub double 1.000000e+00, %17
  %19 = fmul double %.0413, %18
  %20 = add nuw nsw i32 %indvar, 1
  %21 = add nsw i64 %indvars.iv38, -1
  %xtraiter = and i32 %20, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %.025.prol = phi double [ %28, %.prol.preheader ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = sub nsw i64 %21, %indvars.iv.prol
  %23 = getelementptr inbounds double, double* %1, i64 %22
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %.025.prol, %27
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %29 = icmp ult i32 %indvar, 3
  br i1 %29, label %.lr.ph9, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.025 = phi double [ %57, %.lr.ph.new ], [ %.025.unr, %.lr.ph.new.preheader ]
  %30 = sub nsw i64 %21, %indvars.iv
  %31 = getelementptr inbounds double, double* %1, i64 %30
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %.025, %35
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = sub nsw i64 %21, %indvars.iv.next
  %38 = getelementptr inbounds double, double* %1, i64 %37
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %36, %42
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %44 = sub nsw i64 %21, %indvars.iv.next.1
  %45 = getelementptr inbounds double, double* %1, i64 %44
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %43, %49
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %51 = sub nsw i64 %21, %indvars.iv.next.2
  %52 = getelementptr inbounds double, double* %1, i64 %51
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %50, %56
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv38
  br i1 %exitcond.3, label %.lr.ph9.loopexit, label %.lr.ph.new

.lr.ph9.loopexit:                                 ; preds = %.lr.ph.new
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %57, %.lr.ph9.loopexit ]
  %58 = getelementptr inbounds double, double* %1, i64 %indvars.iv38
  %59 = load double, double* %58, align 8
  %60 = fadd double %.lcssa, %59
  %61 = fsub double -0.000000e+00, %60
  %62 = fdiv double %61, %19
  %63 = add nsw i64 %indvars.iv38, -1
  %64 = and i32 %indvar, 1
  %lcmp.mod29 = icmp eq i32 %64, 0
  br i1 %lcmp.mod29, label %.prol.preheader26, label %.prol.loopexit27

.prol.preheader26:                                ; preds = %.lr.ph9
  %65 = load double, double* %2, align 8
  %66 = getelementptr inbounds double, double* %2, i64 %63
  %67 = load double, double* %66, align 8
  %68 = fmul double %62, %67
  %69 = fadd double %65, %68
  store double %69, double* %13, align 16
  br label %.prol.loopexit27

.prol.loopexit27:                                 ; preds = %.prol.preheader26, %.lr.ph9
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader26 ], [ 0, %.lr.ph9 ]
  %70 = icmp eq i32 %indvar, 0
  br i1 %70, label %._crit_edge12, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit27
  %71 = sub i64 %14, %indvars.iv21.unr.ph
  %72 = lshr i64 %71, 1
  %73 = add nuw i64 %72, 1
  %min.iters.check = icmp ult i64 %73, 2
  br i1 %min.iters.check, label %.lr.ph9.new.preheader52, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9.new.preheader
  %n.mod.vf = and i64 %73, 1
  %n.vec = sub i64 %73, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %74 = or i64 %indvars.iv21.unr.ph, 2
  %75 = shl nuw i64 %72, 1
  %76 = add i64 %74, %75
  %77 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %76, %77
  br i1 %cmp.zero, label %.lr.ph9.new.preheader52, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert50 = insertelement <2 x double> undef, double %62, i32 0
  %broadcast.splat51 = shufflevector <2 x double> %broadcast.splatinsert50, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %78 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv21.unr.ph, %78
  %79 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %80 = bitcast double* %79 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %80, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec45 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %81 = sub nsw i64 %63, %offset.idx
  %82 = getelementptr inbounds double, double* %2, i64 %81
  %83 = getelementptr double, double* %82, i64 -3
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec46 = load <4 x double>, <4 x double>* %84, align 8
  %strided.vec47 = shufflevector <4 x double> %wide.vec46, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec47, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec48 = shufflevector <4 x double> %wide.vec46, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse49 = shufflevector <2 x double> %strided.vec48, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %85 = fmul <2 x double> %broadcast.splat51, %reverse49
  %86 = fadd <2 x double> %strided.vec, %85
  %87 = add nuw nsw i64 %offset.idx, 1
  %88 = fmul <2 x double> %broadcast.splat51, %reverse
  %89 = fadd <2 x double> %strided.vec45, %88
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
  br i1 %cmp.n, label %._crit_edge12, label %.lr.ph9.new.preheader52

.lr.ph9.new.preheader52:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9.new.preheader
  %indvars.iv21.ph = phi i64 [ %indvars.iv21.unr.ph, %min.iters.checked ], [ %indvars.iv21.unr.ph, %.lr.ph9.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new.preheader52, %.lr.ph9.new
  %indvars.iv21 = phi i64 [ %indvars.iv.next22.1, %.lr.ph9.new ], [ %indvars.iv21.ph, %.lr.ph9.new.preheader52 ]
  %94 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %95 = load double, double* %94, align 8
  %96 = sub nsw i64 %63, %indvars.iv21
  %97 = getelementptr inbounds double, double* %2, i64 %96
  %98 = load double, double* %97, align 8
  %99 = fmul double %62, %98
  %100 = fadd double %95, %99
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv21
  store double %100, double* %101, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %102 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next22
  %103 = load double, double* %102, align 8
  %104 = sub nsw i64 %63, %indvars.iv.next22
  %105 = getelementptr inbounds double, double* %2, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fmul double %62, %106
  %108 = fadd double %103, %107
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next22
  store double %108, double* %109, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next22.1, %indvars.iv38
  br i1 %exitcond.1, label %._crit_edge12.loopexit, label %.lr.ph9.new, !llvm.loop !7

._crit_edge12.loopexit:                           ; preds = %.lr.ph9.new
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %middle.block, %.prol.loopexit27
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %6, i64 %16, i32 8, i1 false)
  %110 = getelementptr inbounds double, double* %2, i64 %indvars.iv38
  store double %62, double* %110, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
