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
  %12 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(i32 2000, double* %12)
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
  %5 = zext i32 %0 to i64
  %6 = add nsw i64 %5, -1
  %xtraiter = and i64 %5, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %7 = trunc i64 %indvars.iv.prol to i32
  %8 = sub i32 %4, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %9, double* %10, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %11 = icmp ult i64 %6, 3
  br i1 %11, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %12 = trunc i64 %indvars.iv to i32
  %13 = sub i32 %4, %12
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %14, double* %15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = trunc i64 %indvars.iv.next to i32
  %17 = sub i32 %4, %16
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %20 = trunc i64 %indvars.iv.next.1 to i32
  %21 = sub i32 %4, %20
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %22, double* %23, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %24 = trunc i64 %indvars.iv.next.2 to i32
  %25 = sub i32 %4, %24
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %26, double* %27, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %5
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %.._crit_edge_crit_edge, %._crit_edge.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %4 = alloca [2000 x double], align 16
  %5 = load double, double* %1, align 8
  %6 = fsub double -0.000000e+00, %5
  store double %6, double* %2, align 8
  %7 = icmp sgt i32 %0, 1
  br i1 %7, label %.lr.ph19.preheader, label %.._crit_edge20_crit_edge

.._crit_edge20_crit_edge:                         ; preds = %3
  br label %._crit_edge20

.lr.ph19.preheader:                               ; preds = %3
  %8 = load double, double* %1, align 8
  %9 = fsub double -0.000000e+00, %8
  %wide.trip.count37 = zext i32 %0 to i64
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 0
  %sunkaddr = ptrtoint double* %2 to i64
  %11 = bitcast [2000 x double]* %4 to i8*
  %12 = bitcast double* %2 to i8*
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge14..lr.ph_crit_edge, %.lr.ph19.preheader
  %indvar = phi i64 [ 0, %.lr.ph19.preheader ], [ %19, %._crit_edge14..lr.ph_crit_edge ]
  %indvars.iv35 = phi i64 [ 1, %.lr.ph19.preheader ], [ %indvars.iv.next36, %._crit_edge14..lr.ph_crit_edge ]
  %.0316 = phi double [ %9, %.lr.ph19.preheader ], [ %61, %._crit_edge14..lr.ph_crit_edge ]
  %.0415 = phi double [ 1.000000e+00, %.lr.ph19.preheader ], [ %18, %._crit_edge14..lr.ph_crit_edge ]
  %13 = add i64 %indvar, -1
  %14 = shl i64 %indvar, 3
  %15 = add i64 %14, 8
  %16 = fmul double %.0316, %.0316
  %17 = fsub double 1.000000e+00, %16
  %18 = fmul double %.0415, %17
  %19 = add i64 %indvar, 1
  %20 = add nsw i64 %indvars.iv35, -1
  %xtraiter = and i64 %19, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %.025.prol = phi double [ %27, %.prol.preheader..prol.preheader_crit_edge ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %21 = sub nsw i64 %20, %indvars.iv.prol
  %22 = getelementptr inbounds double, double* %1, i64 %21
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %.025.prol, %26
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph..prol.loopexit_crit_edge ], [ %27, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph..prol.loopexit_crit_edge ], [ %27, %.prol.loopexit.loopexit ]
  %28 = icmp ult i64 %indvar, 3
  br i1 %28, label %.prol.loopexit..lr.ph11_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit..lr.ph11_crit_edge:                ; preds = %.prol.loopexit
  br label %.lr.ph11

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.025 = phi double [ %56, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.025.unr, %.lr.ph.new.preheader ]
  %29 = sub nsw i64 %20, %indvars.iv
  %30 = getelementptr inbounds double, double* %1, i64 %29
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %.025, %34
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = sub nsw i64 %20, %indvars.iv.next
  %37 = getelementptr inbounds double, double* %1, i64 %36
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %35, %41
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %43 = sub nsw i64 %20, %indvars.iv.next.1
  %44 = getelementptr inbounds double, double* %1, i64 %43
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %42, %48
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %50 = sub nsw i64 %20, %indvars.iv.next.2
  %51 = getelementptr inbounds double, double* %1, i64 %50
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %49, %55
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv35
  br i1 %exitcond.3, label %.lr.ph11.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.lr.ph11.loopexit:                                ; preds = %.lr.ph.new
  br label %.lr.ph11

.lr.ph11:                                         ; preds = %.prol.loopexit..lr.ph11_crit_edge, %.lr.ph11.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit..lr.ph11_crit_edge ], [ %56, %.lr.ph11.loopexit ]
  %57 = getelementptr inbounds double, double* %1, i64 %indvars.iv35
  %58 = load double, double* %57, align 8
  %59 = fadd double %.lcssa, %58
  %60 = fsub double -0.000000e+00, %59
  %61 = fdiv double %60, %18
  %62 = and i64 %indvar, 1
  %lcmp.mod42 = icmp eq i64 %62, 0
  br i1 %lcmp.mod42, label %.prol.preheader39, label %.lr.ph11..prol.loopexit40_crit_edge

.lr.ph11..prol.loopexit40_crit_edge:              ; preds = %.lr.ph11
  br label %.prol.loopexit40

.prol.preheader39:                                ; preds = %.lr.ph11
  %63 = load double, double* %2, align 8
  %sunkaddr47 = shl i64 %indvars.iv35, 3
  %sunkaddr48 = add i64 %sunkaddr, %sunkaddr47
  %sunkaddr49 = add i64 %sunkaddr48, -8
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to double*
  %64 = load double, double* %sunkaddr50, align 8
  %65 = fmul double %61, %64
  %66 = fadd double %63, %65
  store double %66, double* %10, align 16
  br label %.prol.loopexit40

.prol.loopexit40:                                 ; preds = %.lr.ph11..prol.loopexit40_crit_edge, %.prol.preheader39
  %indvars.iv23.unr.ph = phi i64 [ 1, %.prol.preheader39 ], [ 0, %.lr.ph11..prol.loopexit40_crit_edge ]
  %67 = icmp eq i64 %indvar, 0
  br i1 %67, label %.prol.loopexit40.._crit_edge14_crit_edge, label %.lr.ph11.new.preheader

.prol.loopexit40.._crit_edge14_crit_edge:         ; preds = %.prol.loopexit40
  br label %._crit_edge14

.lr.ph11.new.preheader:                           ; preds = %.prol.loopexit40
  %68 = sub i64 %13, %indvars.iv23.unr.ph
  %69 = lshr i64 %68, 1
  %70 = add nuw i64 %69, 1
  %min.iters.check = icmp ult i64 %70, 2
  br i1 %min.iters.check, label %.lr.ph11.new.preheader..lr.ph11.new.preheader62_crit_edge, label %min.iters.checked

.lr.ph11.new.preheader..lr.ph11.new.preheader62_crit_edge: ; preds = %.lr.ph11.new.preheader
  br label %.lr.ph11.new.preheader62

min.iters.checked:                                ; preds = %.lr.ph11.new.preheader
  %n.mod.vf = and i64 %70, 1
  %n.vec = sub i64 %70, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %71 = or i64 %indvars.iv23.unr.ph, 2
  %72 = shl nuw i64 %69, 1
  %73 = add i64 %71, %72
  %74 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %73, %74
  br i1 %cmp.zero, label %min.iters.checked..lr.ph11.new.preheader62_crit_edge, label %vector.ph

min.iters.checked..lr.ph11.new.preheader62_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph11.new.preheader62

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %61, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %75 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv23.unr.ph, %75
  %76 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %77 = bitcast double* %76 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %77, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec55 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %78 = sub nsw i64 %20, %offset.idx
  %79 = getelementptr inbounds double, double* %2, i64 %78
  %80 = getelementptr double, double* %79, i64 -3
  %81 = bitcast double* %80 to <4 x double>*
  %wide.vec56 = load <4 x double>, <4 x double>* %81, align 8
  %strided.vec57 = shufflevector <4 x double> %wide.vec56, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec57, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec58 = shufflevector <4 x double> %wide.vec56, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse59 = shufflevector <2 x double> %strided.vec58, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %82 = fmul <2 x double> %broadcast.splat61, %reverse59
  %83 = fadd <2 x double> %strided.vec, %82
  %84 = add nuw nsw i64 %offset.idx, 1
  %85 = fmul <2 x double> %broadcast.splat61, %reverse
  %86 = fadd <2 x double> %strided.vec55, %85
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %84
  %88 = getelementptr double, double* %87, i64 -1
  %89 = bitcast double* %88 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %83, <2 x double> %86, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %89, align 8
  %index.next = add i64 %index, 2
  %90 = icmp eq i64 %index.next, %n.vec
  br i1 %90, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !4

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.._crit_edge14_crit_edge, label %middle.block..lr.ph11.new.preheader62_crit_edge

middle.block..lr.ph11.new.preheader62_crit_edge:  ; preds = %middle.block
  br label %.lr.ph11.new.preheader62

middle.block.._crit_edge14_crit_edge:             ; preds = %middle.block
  br label %._crit_edge14

.lr.ph11.new.preheader62:                         ; preds = %middle.block..lr.ph11.new.preheader62_crit_edge, %min.iters.checked..lr.ph11.new.preheader62_crit_edge, %.lr.ph11.new.preheader..lr.ph11.new.preheader62_crit_edge
  %indvars.iv23.ph = phi i64 [ %indvars.iv23.unr.ph, %min.iters.checked..lr.ph11.new.preheader62_crit_edge ], [ %indvars.iv23.unr.ph, %.lr.ph11.new.preheader..lr.ph11.new.preheader62_crit_edge ], [ %ind.end, %middle.block..lr.ph11.new.preheader62_crit_edge ]
  br label %.lr.ph11.new

.lr.ph11.new:                                     ; preds = %.lr.ph11.new..lr.ph11.new_crit_edge, %.lr.ph11.new.preheader62
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.1, %.lr.ph11.new..lr.ph11.new_crit_edge ], [ %indvars.iv23.ph, %.lr.ph11.new.preheader62 ]
  %91 = getelementptr inbounds double, double* %2, i64 %indvars.iv23
  %92 = load double, double* %91, align 8
  %93 = sub nsw i64 %20, %indvars.iv23
  %94 = getelementptr inbounds double, double* %2, i64 %93
  %95 = load double, double* %94, align 8
  %96 = fmul double %61, %95
  %97 = fadd double %92, %96
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv23
  store double %97, double* %98, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %99 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next24
  %100 = load double, double* %99, align 8
  %101 = sub nsw i64 %20, %indvars.iv.next24
  %102 = getelementptr inbounds double, double* %2, i64 %101
  %103 = load double, double* %102, align 8
  %104 = fmul double %61, %103
  %105 = fadd double %100, %104
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 0, i64 %indvars.iv.next24
  store double %105, double* %106, align 8
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next24.1, %indvars.iv35
  br i1 %exitcond28.1, label %._crit_edge14.loopexit, label %.lr.ph11.new..lr.ph11.new_crit_edge, !llvm.loop !7

.lr.ph11.new..lr.ph11.new_crit_edge:              ; preds = %.lr.ph11.new
  br label %.lr.ph11.new

._crit_edge14.loopexit:                           ; preds = %.lr.ph11.new
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %middle.block.._crit_edge14_crit_edge, %.prol.loopexit40.._crit_edge14_crit_edge, %._crit_edge14.loopexit
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* nonnull %11, i64 %15, i32 8, i1 false)
  %107 = getelementptr inbounds double, double* %2, i64 %indvars.iv35
  store double %61, double* %107, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
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
  br i1 %7, label %.lr.ph.preheader, label %.._crit_edge3_crit_edge

.._crit_edge3_crit_edge:                          ; preds = %2
  br label %._crit_edge3

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.lr.ph.._crit_edge_crit_edge

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.lr.ph
  br label %._crit_edge

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge3.loopexit, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  br label %.lr.ph

._crit_edge3.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %.._crit_edge3_crit_edge, %._crit_edge3.loopexit
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
