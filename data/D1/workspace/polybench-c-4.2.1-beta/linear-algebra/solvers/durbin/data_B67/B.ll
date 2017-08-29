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
  br i1 %7, label %8, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %8
  br label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 2000, double* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.lr.ph:                                           ; preds = %2
  %4 = add nsw i32 %0, 1
  %wide.trip.count = zext i32 %0 to i64
  %5 = add nsw i64 %wide.trip.count, -1
  %xtraiter = and i64 %wide.trip.count, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.._crit_edge2.prol.loopexit_crit_edge, label %._crit_edge2.prol.preheader

.lr.ph.._crit_edge2.prol.loopexit_crit_edge:      ; preds = %.lr.ph
  br label %._crit_edge2.prol.loopexit

._crit_edge2.prol.preheader:                      ; preds = %.lr.ph
  br label %._crit_edge2.prol

._crit_edge2.prol:                                ; preds = %._crit_edge2.prol.._crit_edge2.prol_crit_edge, %._crit_edge2.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge2.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge2.prol.._crit_edge2.prol_crit_edge ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge2.prol.preheader ], [ %prol.iter.sub, %._crit_edge2.prol.._crit_edge2.prol_crit_edge ]
  %6 = trunc i64 %indvars.iv.prol to i32
  %7 = sub i32 %4, %6
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %8, double* %9, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge2.prol.loopexit.unr-lcssa, label %._crit_edge2.prol.._crit_edge2.prol_crit_edge, !llvm.loop !1

._crit_edge2.prol.._crit_edge2.prol_crit_edge:    ; preds = %._crit_edge2.prol
  br label %._crit_edge2.prol

._crit_edge2.prol.loopexit.unr-lcssa:             ; preds = %._crit_edge2.prol
  br label %._crit_edge2.prol.loopexit

._crit_edge2.prol.loopexit:                       ; preds = %.lr.ph.._crit_edge2.prol.loopexit_crit_edge, %._crit_edge2.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.._crit_edge2.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %._crit_edge2.prol.loopexit.unr-lcssa ]
  %10 = icmp ult i64 %5, 3
  br i1 %10, label %._crit_edge2.prol.loopexit.._crit_edge.loopexit_crit_edge, label %.lr.ph.new

._crit_edge2.prol.loopexit.._crit_edge.loopexit_crit_edge: ; preds = %._crit_edge2.prol.loopexit
  br label %._crit_edge.loopexit

.lr.ph.new:                                       ; preds = %._crit_edge2.prol.loopexit
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.._crit_edge2_crit_edge, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge2.._crit_edge2_crit_edge ]
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
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.3, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge2.._crit_edge2_crit_edge

._crit_edge2.._crit_edge2_crit_edge:              ; preds = %._crit_edge2
  br label %._crit_edge2

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge2
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge2.prol.loopexit.._crit_edge.loopexit_crit_edge, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
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
  br i1 %9, label %.lr.ph19.preheader, label %.._crit_edge20_crit_edge

.._crit_edge20_crit_edge:                         ; preds = %3
  br label %._crit_edge20

.lr.ph19.preheader:                               ; preds = %3
  %10 = load double, double* %1, align 8
  %11 = fsub double -0.000000e+00, %10
  %12 = add i32 %0, -1
  %wide.trip.count37 = zext i32 %12 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge14..lr.ph_crit_edge, %.lr.ph19.preheader
  %indvars.iv35 = phi i64 [ 1, %.lr.ph19.preheader ], [ %indvars.iv.next36, %._crit_edge14..lr.ph_crit_edge ]
  %indvar = phi i64 [ 0, %.lr.ph19.preheader ], [ %54, %._crit_edge14..lr.ph_crit_edge ]
  %.0416 = phi double [ %11, %.lr.ph19.preheader ], [ %61, %._crit_edge14..lr.ph_crit_edge ]
  %.0515 = phi double [ 1.000000e+00, %.lr.ph19.preheader ], [ %56, %._crit_edge14..lr.ph_crit_edge ]
  %13 = add i64 %indvar, 1
  %14 = shl i64 %indvar, 3
  %15 = fmul double %.0416, %.0416
  %16 = fsub double 1.000000e+00, %15
  %17 = add nsw i64 %indvars.iv35, -1
  %xtraiter = and i64 %13, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.._crit_edge39.prol.loopexit_crit_edge, label %._crit_edge39.prol.preheader

.lr.ph.._crit_edge39.prol.loopexit_crit_edge:     ; preds = %.lr.ph
  br label %._crit_edge39.prol.loopexit

._crit_edge39.prol.preheader:                     ; preds = %.lr.ph
  br label %._crit_edge39.prol

._crit_edge39.prol:                               ; preds = %._crit_edge39.prol.._crit_edge39.prol_crit_edge, %._crit_edge39.prol.preheader
  %indvars.iv.prol = phi i64 [ 0, %._crit_edge39.prol.preheader ], [ %indvars.iv.next.prol, %._crit_edge39.prol.._crit_edge39.prol_crit_edge ]
  %.036.prol = phi double [ 0.000000e+00, %._crit_edge39.prol.preheader ], [ %24, %._crit_edge39.prol.._crit_edge39.prol_crit_edge ]
  %prol.iter = phi i64 [ %xtraiter, %._crit_edge39.prol.preheader ], [ %prol.iter.sub, %._crit_edge39.prol.._crit_edge39.prol_crit_edge ]
  %18 = sub nsw i64 %17, %indvars.iv.prol
  %19 = getelementptr inbounds double, double* %1, i64 %18
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %.036.prol, %23
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge39.prol.loopexit.unr-lcssa, label %._crit_edge39.prol.._crit_edge39.prol_crit_edge, !llvm.loop !3

._crit_edge39.prol.._crit_edge39.prol_crit_edge:  ; preds = %._crit_edge39.prol
  br label %._crit_edge39.prol

._crit_edge39.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge39.prol
  br label %._crit_edge39.prol.loopexit

._crit_edge39.prol.loopexit:                      ; preds = %.lr.ph.._crit_edge39.prol.loopexit_crit_edge, %._crit_edge39.prol.loopexit.unr-lcssa
  %.lcssa.unr = phi double [ undef, %.lr.ph.._crit_edge39.prol.loopexit_crit_edge ], [ %24, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.._crit_edge39.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %.036.unr = phi double [ 0.000000e+00, %.lr.ph.._crit_edge39.prol.loopexit_crit_edge ], [ %24, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %25 = icmp ult i64 %indvar, 3
  br i1 %25, label %._crit_edge39.prol.loopexit..lr.ph11_crit_edge, label %.lr.ph.new

._crit_edge39.prol.loopexit..lr.ph11_crit_edge:   ; preds = %._crit_edge39.prol.loopexit
  br label %.lr.ph11

.lr.ph.new:                                       ; preds = %._crit_edge39.prol.loopexit
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.._crit_edge39_crit_edge, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %.lr.ph.new ], [ %indvars.iv.next.3, %._crit_edge39.._crit_edge39_crit_edge ]
  %.036 = phi double [ %.036.unr, %.lr.ph.new ], [ %53, %._crit_edge39.._crit_edge39_crit_edge ]
  %26 = sub nsw i64 %17, %indvars.iv
  %27 = getelementptr inbounds double, double* %1, i64 %26
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %.036, %31
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = sub nsw i64 %17, %indvars.iv.next
  %34 = getelementptr inbounds double, double* %1, i64 %33
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %32, %38
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %40 = sub nsw i64 %17, %indvars.iv.next.1
  %41 = getelementptr inbounds double, double* %1, i64 %40
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %39, %45
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %47 = sub nsw i64 %17, %indvars.iv.next.2
  %48 = getelementptr inbounds double, double* %1, i64 %47
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %46, %52
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv35
  br i1 %exitcond.3, label %.lr.ph11.unr-lcssa, label %._crit_edge39.._crit_edge39_crit_edge

._crit_edge39.._crit_edge39_crit_edge:            ; preds = %._crit_edge39
  br label %._crit_edge39

.lr.ph11.unr-lcssa:                               ; preds = %._crit_edge39
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %._crit_edge39.prol.loopexit..lr.ph11_crit_edge, %.lr.ph11.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr, %._crit_edge39.prol.loopexit..lr.ph11_crit_edge ], [ %53, %.lr.ph11.unr-lcssa ]
  %54 = add nuw nsw i64 %indvar, 1
  %55 = add nuw nsw i64 %14, 8
  %56 = fmul double %.0515, %16
  %57 = getelementptr inbounds double, double* %1, i64 %indvars.iv35
  %58 = load double, double* %57, align 8
  %59 = fadd double %.lcssa, %58
  %60 = fsub double -0.000000e+00, %59
  %61 = fdiv double %60, %56
  %min.iters.check = icmp ult i64 %54, 4
  br i1 %min.iters.check, label %.lr.ph11.._crit_edge40.preheader_crit_edge, label %min.iters.checked

.lr.ph11.._crit_edge40.preheader_crit_edge:       ; preds = %.lr.ph11
  br label %._crit_edge40.preheader

min.iters.checked:                                ; preds = %.lr.ph11
  %n.vec = and i64 %54, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge40.preheader_crit_edge, label %vector.ph

min.iters.checked.._crit_edge40.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge40.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert46 = insertelement <2 x double> undef, double %61, i32 0
  %broadcast.splat47 = shufflevector <2 x double> %broadcast.splatinsert46, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %62 = getelementptr inbounds double, double* %2, i64 %index
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %63, align 8
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %65, align 8
  %66 = sub nsw i64 %17, %index
  %67 = getelementptr inbounds double, double* %2, i64 %66
  %68 = getelementptr double, double* %67, i64 -1
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %69, align 8
  %reverse = shufflevector <2 x double> %wide.load43, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %70 = getelementptr double, double* %67, i64 -2
  %71 = getelementptr double, double* %70, i64 -1
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %72, align 8
  %reverse45 = shufflevector <2 x double> %wide.load44, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %73 = fmul <2 x double> %broadcast.splat47, %reverse
  %74 = fmul <2 x double> %broadcast.splat47, %reverse45
  %75 = fadd <2 x double> %wide.load, %73
  %76 = fadd <2 x double> %wide.load42, %74
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> %75, <2 x double>* %78, align 16
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %76, <2 x double>* %80, align 16
  %index.next = add i64 %index, 4
  %81 = icmp eq i64 %index.next, %n.vec
  br i1 %81, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !4

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %54, %n.vec
  br i1 %cmp.n, label %middle.block.._crit_edge14_crit_edge, label %middle.block.._crit_edge40.preheader_crit_edge

middle.block.._crit_edge40.preheader_crit_edge:   ; preds = %middle.block
  br label %._crit_edge40.preheader

middle.block.._crit_edge14_crit_edge:             ; preds = %middle.block
  br label %._crit_edge14

._crit_edge40.preheader:                          ; preds = %middle.block.._crit_edge40.preheader_crit_edge, %min.iters.checked.._crit_edge40.preheader_crit_edge, %.lr.ph11.._crit_edge40.preheader_crit_edge
  %indvars.iv23.ph = phi i64 [ 0, %min.iters.checked.._crit_edge40.preheader_crit_edge ], [ 0, %.lr.ph11.._crit_edge40.preheader_crit_edge ], [ %n.vec, %middle.block.._crit_edge40.preheader_crit_edge ]
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.._crit_edge40_crit_edge, %._crit_edge40.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge40.._crit_edge40_crit_edge ], [ %indvars.iv23.ph, %._crit_edge40.preheader ]
  %82 = getelementptr inbounds double, double* %2, i64 %indvars.iv23
  %83 = load double, double* %82, align 8
  %84 = sub nsw i64 %17, %indvars.iv23
  %85 = getelementptr inbounds double, double* %2, i64 %84
  %86 = load double, double* %85, align 8
  %87 = fmul double %61, %86
  %88 = fadd double %83, %87
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv23
  store double %88, double* %89, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next24, %indvars.iv35
  br i1 %exitcond28, label %._crit_edge14.loopexit, label %._crit_edge40.._crit_edge40_crit_edge, !llvm.loop !7

._crit_edge40.._crit_edge40_crit_edge:            ; preds = %._crit_edge40
  br label %._crit_edge40

._crit_edge14.loopexit:                           ; preds = %._crit_edge40
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %middle.block.._crit_edge14_crit_edge, %._crit_edge14.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %4, i8* nonnull %6, i64 %55, i32 8, i1 false)
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv35
  store double %61, double* %90, align 8
  %exitcond38 = icmp eq i64 %54, %wide.trip.count37
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  br i1 %exitcond38, label %._crit_edge20.loopexit, label %._crit_edge14..lr.ph_crit_edge

._crit_edge14..lr.ph_crit_edge:                   ; preds = %._crit_edge14
  br label %.lr.ph

._crit_edge20.loopexit:                           ; preds = %._crit_edge14
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %.._crit_edge20_crit_edge, %._crit_edge20.loopexit
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
  br i1 %7, label %.lr.ph.preheader, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph..lr.ph._crit_edge_crit_edge

.lr.ph..lr.ph._crit_edge_crit_edge:               ; preds = %.lr.ph
  br label %.lr.ph._crit_edge

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph..lr.ph._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph._crit_edge..lr.ph_crit_edge

.lr.ph._crit_edge..lr.ph_crit_edge:               ; preds = %.lr.ph._crit_edge
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
