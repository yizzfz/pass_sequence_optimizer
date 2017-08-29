; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge2

._crit_edge2:                                     ; preds = %12
  br label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %._crit_edge2, %._crit_edge, %15
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.us.preheader:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge11.us..preheader4.us_crit_edge ], [ 0, %.preheader4.us.preheader ]
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv21 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next22, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv21, %indvars.iv25
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv21
  store double %12, double* %13, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next22, 1000
  br i1 %exitcond31, label %._crit_edge11.us, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %6

._crit_edge11.us:                                 ; preds = %6
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond32, label %.preheader.us.preheader, label %._crit_edge11.us..preheader4.us_crit_edge

._crit_edge11.us..preheader4.us_crit_edge:        ; preds = %._crit_edge11.us
  br label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %14

; <label>:14:                                     ; preds = %._crit_edge34, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge34 ]
  %15 = mul nuw nsw i64 %indvars.iv, %indvars.iv17
  %16 = add nuw nsw i64 %15, 2
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge34

._crit_edge34:                                    ; preds = %14
  br label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond30, label %._crit_edge8, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.lr.ph.us.preheader:
  %broadcast.splatinsert79 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat80 = shufflevector <2 x double> %broadcast.splatinsert79, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %3
  store double %8, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv.next
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %3
  store double %14, double* %12, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %3
  store double %17, double* %15, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond26.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv43
  br i1 %exitcond26.3, label %.preheader.us13.preheader.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge, !llvm.loop !1

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.preheader.us13.new:                              ; preds = %.preheader.us13.new..preheader.us13.new_crit_edge, %.preheader.us13.new.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %.preheader.us13.new..preheader.us13.new_crit_edge ], [ %indvars.iv27.unr.ph, %.preheader.us13.new.preheader ]
  %18 = load double, double* %34, align 8
  %19 = fmul double %18, %2
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv39
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv27
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %23, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %26 = load double, double* %34, align 8
  %27 = fmul double %26, %2
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next28, i64 %indvars.iv39
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv.next28
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next28.1 = add nuw nsw i64 %indvars.iv27, 2
  %exitcond34.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv43
  br i1 %exitcond34.1, label %._crit_edge.us16.loopexit, label %.preheader.us13.new..preheader.us13.new_crit_edge

.preheader.us13.new..preheader.us13.new_crit_edge: ; preds = %.preheader.us13.new
  br label %.preheader.us13.new

.preheader.us13:                                  ; preds = %._crit_edge.us16..preheader.us13_crit_edge, %.preheader.us13.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us16..preheader.us13_crit_edge ], [ 0, %.preheader.us13.preheader ]
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv45, i64 %indvars.iv39
  br i1 %75, label %.preheader.us13..prol.loopexit36_crit_edge, label %.prol.preheader35

.preheader.us13..prol.loopexit36_crit_edge:       ; preds = %.preheader.us13
  br label %.prol.loopexit36

.prol.preheader35:                                ; preds = %.preheader.us13
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %2
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv39
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %74, align 8
  %41 = fadd double %40, %39
  store double %41, double* %74, align 8
  br label %.prol.loopexit36

.prol.loopexit36:                                 ; preds = %.preheader.us13..prol.loopexit36_crit_edge, %.prol.preheader35
  %indvars.iv27.unr.ph = phi i64 [ 1, %.prol.preheader35 ], [ 0, %.preheader.us13..prol.loopexit36_crit_edge ]
  br i1 %76, label %.prol.loopexit36.._crit_edge.us16_crit_edge, label %.preheader.us13.new.preheader

.prol.loopexit36.._crit_edge.us16_crit_edge:      ; preds = %.prol.loopexit36
  br label %._crit_edge.us16

.preheader.us13.new.preheader:                    ; preds = %.prol.loopexit36
  br label %.preheader.us13.new

.lr.ph.us:                                        ; preds = %._crit_edge9.us..lr.ph.us_crit_edge, %.lr.ph.us.preheader
  %indvars.iv70 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next71, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %indvars.iv45 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next46, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %indvars.iv43 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next44, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %42 = add i64 %indvars.iv45, -3
  %43 = zext i2 %indvars.iv70 to i64
  %44 = add nuw nsw i64 %43, 4294967295
  %45 = and i64 %44, 4294967295
  %46 = add nuw nsw i64 %45, 1
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %47 = trunc i64 %indvars.iv.next46 to i32
  %xtraiter = and i32 %47, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv.prol
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %3
  store double %50, double* %48, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !5

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us..prol.loopexit_crit_edge ], [ %46, %.prol.loopexit.loopexit ]
  %51 = icmp ult i64 %indvars.iv45, 3
  br i1 %51, label %.prol.loopexit..preheader.us13.preheader_crit_edge, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..preheader.us13.preheader_crit_edge: ; preds = %.prol.loopexit
  br label %.preheader.us13.preheader

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  %52 = sub i64 %42, %indvars.iv.unr
  %53 = lshr i64 %52, 2
  %54 = add nuw nsw i64 %53, 1
  %min.iters.check = icmp ult i64 %54, 2
  br i1 %min.iters.check, label %.prol.loopexit..lr.ph.us.new_crit_edge..lr.ph.us.new.preheader_crit_edge, label %min.iters.checked

.prol.loopexit..lr.ph.us.new_crit_edge..lr.ph.us.new.preheader_crit_edge: ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge
  br label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %middle.block..lr.ph.us.new.preheader_crit_edge, %min.iters.checked..lr.ph.us.new.preheader_crit_edge, %.prol.loopexit..lr.ph.us.new_crit_edge..lr.ph.us.new.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked..lr.ph.us.new.preheader_crit_edge ], [ %indvars.iv.unr, %.prol.loopexit..lr.ph.us.new_crit_edge..lr.ph.us.new.preheader_crit_edge ], [ %ind.end, %middle.block..lr.ph.us.new.preheader_crit_edge ]
  br label %.lr.ph.us.new

min.iters.checked:                                ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge
  %n.mod.vf = and i64 %54, 1
  %n.vec = sub nsw i64 %54, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %55 = add nsw i64 %indvars.iv.unr, 4
  %56 = shl nuw i64 %53, 2
  %57 = add i64 %55, %56
  %58 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %57, %58
  br i1 %cmp.zero, label %min.iters.checked..lr.ph.us.new.preheader_crit_edge, label %vector.ph

min.iters.checked..lr.ph.us.new.preheader_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph.us.new.preheader

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %59 = shl i64 %index, 2
  %60 = add i64 %indvars.iv.unr, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %60
  %62 = bitcast double* %61 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %62, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec76 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec77 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec78 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %63 = fmul <2 x double> %strided.vec, %broadcast.splat80
  %64 = fmul <2 x double> %strided.vec76, %broadcast.splat80
  %65 = fmul <2 x double> %strided.vec77, %broadcast.splat80
  %66 = add nsw i64 %60, 3
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %66
  %68 = fmul <2 x double> %strided.vec78, %broadcast.splat80
  %69 = getelementptr double, double* %67, i64 -3
  %70 = bitcast double* %69 to <8 x double>*
  %71 = shufflevector <2 x double> %63, <2 x double> %64, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %72 = shufflevector <2 x double> %65, <2 x double> %68, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %71, <4 x double> %72, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %70, align 8
  %index.next = add i64 %index, 2
  %73 = icmp eq i64 %index.next, %n.vec
  br i1 %73, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !7

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..preheader.us13.preheader_crit_edge, label %middle.block..lr.ph.us.new.preheader_crit_edge

middle.block..lr.ph.us.new.preheader_crit_edge:   ; preds = %middle.block
  br label %.lr.ph.us.new.preheader

middle.block..preheader.us13.preheader_crit_edge: ; preds = %middle.block
  br label %.preheader.us13.preheader

.preheader.us13.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us13.preheader

.preheader.us13.preheader:                        ; preds = %middle.block..preheader.us13.preheader_crit_edge, %.prol.loopexit..preheader.us13.preheader_crit_edge, %.preheader.us13.preheader.loopexit
  %xtraiter3768 = and i64 %indvars.iv.next46, 1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 0
  %75 = icmp eq i64 %xtraiter3768, 0
  %76 = icmp eq i64 %indvars.iv45, 0
  br label %.preheader.us13

._crit_edge.us16.loopexit:                        ; preds = %.preheader.us13.new
  br label %._crit_edge.us16

._crit_edge.us16:                                 ; preds = %.prol.loopexit36.._crit_edge.us16_crit_edge, %._crit_edge.us16.loopexit
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 1000
  br i1 %exitcond, label %._crit_edge9.us, label %._crit_edge.us16..preheader.us13_crit_edge

._crit_edge.us16..preheader.us13_crit_edge:       ; preds = %._crit_edge.us16
  br label %.preheader.us13

._crit_edge9.us:                                  ; preds = %._crit_edge.us16
  %exitcond72 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond72, label %._crit_edge11, label %._crit_edge9.us..lr.ph.us_crit_edge

._crit_edge9.us..lr.ph.us_crit_edge:              ; preds = %._crit_edge9.us
  %indvars.iv.next71 = add i2 %indvars.iv70, 1
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  br label %.lr.ph.us

._crit_edge11:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next8, %._crit_edge.us..preheader.us_crit_edge ]
  %6 = mul nsw i64 %indvars.iv7, 1200
  br label %7

; <label>:7:                                      ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %8 = add nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge13

._crit_edge13:                                    ; preds = %14
  br label %7

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond11, label %._crit_edge4, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
