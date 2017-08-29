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
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  tail call fastcc void @kernel_syrk(double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array([1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %15
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader4.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us..preheader4.us_crit_edge, %.preheader4.lr.ph
  %indvars.iv23 = phi i64 [ 0, %.preheader4.lr.ph ], [ %indvars.iv.next24, %._crit_edge11.us..preheader4.us_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %._crit_edge.._crit_edge_crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %5 = add nuw nsw i64 %4, 1
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 1200
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv19
  store double %9, double* %10, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond30, label %._crit_edge11.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge11.us:                                 ; preds = %._crit_edge
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond31, label %.preheader.us.preheader, label %._crit_edge11.us..preheader4.us_crit_edge

._crit_edge11.us..preheader4.us_crit_edge:        ; preds = %._crit_edge11.us
  br label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.._crit_edge1_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge1.._crit_edge1_crit_edge ]
  %11 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %12 = add nuw nsw i64 %11, 2
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  store double %16, double* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond29, label %._crit_edge.us, label %._crit_edge1.._crit_edge1_crit_edge

._crit_edge1.._crit_edge1_crit_edge:              ; preds = %._crit_edge1
  br label %._crit_edge1

._crit_edge.us:                                   ; preds = %._crit_edge1
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond, label %._crit_edge8, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader4.lr.ph:
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %1, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader ]
  %4 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv
  %5 = load double, double* %4, align 8
  %6 = fmul double %5, %1
  store double %6, double* %4, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %1
  store double %9, double* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %1
  store double %12, double* %10, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next.2
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %1
  store double %15, double* %13, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv36
  br i1 %exitcond.3, label %.preheader.us14.preheader.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge, !llvm.loop !1

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.preheader.us14.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us14.preheader

.preheader.us14.preheader:                        ; preds = %middle.block..preheader.us14.preheader_crit_edge, %.prol.loopexit..preheader.us14.preheader_crit_edge, %.preheader.us14.preheader.loopexit
  %16 = and i64 %indvars.iv38, 1
  %lcmp.mod56 = icmp eq i64 %16, 0
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 0
  %18 = icmp eq i64 %indvars.iv38, 0
  br label %.preheader.us14

.preheader.us14:                                  ; preds = %._crit_edge.us18..preheader.us14_crit_edge, %.preheader.us14.preheader
  %indvars.iv31 = phi i64 [ 0, %.preheader.us14.preheader ], [ %indvars.iv.next32, %._crit_edge.us18..preheader.us14_crit_edge ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %lcmp.mod56, label %.prol.preheader53, label %.preheader.us14..prol.loopexit54_crit_edge

.preheader.us14..prol.loopexit54_crit_edge:       ; preds = %.preheader.us14
  br label %.prol.loopexit54

.prol.preheader53:                                ; preds = %.preheader.us14
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %0
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv31
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = load double, double* %17, align 8
  %26 = fadd double %25, %24
  store double %26, double* %17, align 8
  br label %.prol.loopexit54

.prol.loopexit54:                                 ; preds = %.preheader.us14..prol.loopexit54_crit_edge, %.prol.preheader53
  %indvars.iv25.unr.ph = phi i64 [ 1, %.prol.preheader53 ], [ 0, %.preheader.us14..prol.loopexit54_crit_edge ]
  br i1 %18, label %.prol.loopexit54.._crit_edge.us18_crit_edge, label %.preheader.us14.new.preheader

.prol.loopexit54.._crit_edge.us18_crit_edge:      ; preds = %.prol.loopexit54
  br label %._crit_edge.us18

.preheader.us14.new.preheader:                    ; preds = %.prol.loopexit54
  br label %.preheader.us14.new

.preheader.us14.new:                              ; preds = %.preheader.us14.new..preheader.us14.new_crit_edge, %.preheader.us14.new.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.preheader.us14.new..preheader.us14.new_crit_edge ], [ %indvars.iv25.unr.ph, %.preheader.us14.new.preheader ]
  %27 = load double, double* %19, align 8
  %28 = fmul double %27, %0
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv31
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv25
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %35 = load double, double* %19, align 8
  %36 = fmul double %35, %0
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv31
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next26
  %41 = load double, double* %40, align 8
  %42 = fadd double %41, %39
  store double %42, double* %40, align 8
  %indvars.iv.next26.1 = add nuw nsw i64 %indvars.iv25, 2
  %exitcond30.1 = icmp eq i64 %indvars.iv.next26.1, %indvars.iv36
  br i1 %exitcond30.1, label %._crit_edge.us18.loopexit, label %.preheader.us14.new..preheader.us14.new_crit_edge

.preheader.us14.new..preheader.us14.new_crit_edge: ; preds = %.preheader.us14.new
  br label %.preheader.us14.new

.lr.ph.us:                                        ; preds = %._crit_edge9.us..lr.ph.us_crit_edge, %.preheader4.lr.ph
  %indvars.iv63 = phi i2 [ 1, %.preheader4.lr.ph ], [ %indvars.iv.next64, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %indvars.iv38 = phi i64 [ 0, %.preheader4.lr.ph ], [ %45, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %indvars.iv36 = phi i64 [ 1, %.preheader4.lr.ph ], [ %indvars.iv.next37, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %43 = add i64 %indvars.iv38, -3
  %44 = zext i2 %indvars.iv63 to i64
  %45 = add nuw nsw i64 %indvars.iv38, 1
  %xtraiter = and i64 %45, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader..prol.preheader_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.prol
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %1
  store double %48, double* %46, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !5

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us..prol.loopexit_crit_edge ], [ %44, %.prol.loopexit.loopexit ]
  %49 = icmp ult i64 %indvars.iv38, 3
  br i1 %49, label %.prol.loopexit..preheader.us14.preheader_crit_edge, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..preheader.us14.preheader_crit_edge: ; preds = %.prol.loopexit
  br label %.preheader.us14.preheader

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  %50 = sub i64 %43, %indvars.iv.unr
  %51 = lshr i64 %50, 2
  %52 = add nuw nsw i64 %51, 1
  %min.iters.check = icmp ult i64 %52, 2
  br i1 %min.iters.check, label %.prol.loopexit..lr.ph.us.new_crit_edge..lr.ph.us.new.preheader_crit_edge, label %min.iters.checked

.prol.loopexit..lr.ph.us.new_crit_edge..lr.ph.us.new.preheader_crit_edge: ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge
  br label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %middle.block..lr.ph.us.new.preheader_crit_edge, %min.iters.checked..lr.ph.us.new.preheader_crit_edge, %.prol.loopexit..lr.ph.us.new_crit_edge..lr.ph.us.new.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block..lr.ph.us.new.preheader_crit_edge ], [ %indvars.iv.unr, %min.iters.checked..lr.ph.us.new.preheader_crit_edge ], [ %indvars.iv.unr, %.prol.loopexit..lr.ph.us.new_crit_edge..lr.ph.us.new.preheader_crit_edge ]
  br label %.lr.ph.us.new

min.iters.checked:                                ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge
  %n.mod.vf = and i64 %52, 1
  %n.vec = sub nsw i64 %52, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %53 = or i64 %indvars.iv.unr, 4
  %54 = shl nuw i64 %51, 2
  %55 = add i64 %53, %54
  %56 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %55, %56
  br i1 %cmp.zero, label %min.iters.checked..lr.ph.us.new.preheader_crit_edge, label %vector.ph

min.iters.checked..lr.ph.us.new.preheader_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph.us.new.preheader

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %57 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv.unr, %57
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %offset.idx
  %59 = bitcast double* %58 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %59, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec1 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec2 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec3 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %60 = fmul <2 x double> %strided.vec, %broadcast.splat5
  %61 = fmul <2 x double> %strided.vec1, %broadcast.splat5
  %62 = fmul <2 x double> %strided.vec2, %broadcast.splat5
  %63 = add nsw i64 %offset.idx, 3
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %63
  %65 = fmul <2 x double> %strided.vec3, %broadcast.splat5
  %66 = getelementptr double, double* %64, i64 -3
  %67 = bitcast double* %66 to <8 x double>*
  %68 = shufflevector <2 x double> %60, <2 x double> %61, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %69 = shufflevector <2 x double> %62, <2 x double> %65, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %68, <4 x double> %69, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %67, align 8
  %index.next = add i64 %index, 2
  %70 = icmp eq i64 %index.next, %n.vec
  br i1 %70, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !7

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block..preheader.us14.preheader_crit_edge, label %middle.block..lr.ph.us.new.preheader_crit_edge

middle.block..lr.ph.us.new.preheader_crit_edge:   ; preds = %middle.block
  br label %.lr.ph.us.new.preheader

middle.block..preheader.us14.preheader_crit_edge: ; preds = %middle.block
  br label %.preheader.us14.preheader

._crit_edge.us18.loopexit:                        ; preds = %.preheader.us14.new
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %.prol.loopexit54.._crit_edge.us18_crit_edge, %._crit_edge.us18.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond, label %._crit_edge9.us, label %._crit_edge.us18..preheader.us14_crit_edge

._crit_edge.us18..preheader.us14_crit_edge:       ; preds = %._crit_edge.us18
  br label %.preheader.us14

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %exitcond65 = icmp eq i64 %45, 1200
  br i1 %exitcond65, label %._crit_edge13, label %._crit_edge9.us..lr.ph.us_crit_edge

._crit_edge9.us..lr.ph.us_crit_edge:              ; preds = %._crit_edge9.us
  %indvars.iv.next64 = add i2 %indvars.iv63, 1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  br label %.lr.ph.us

._crit_edge13:                                    ; preds = %._crit_edge9.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge3.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge3.us..preheader.us_crit_edge ]
  %5 = mul nsw i64 %indvars.iv6, 1200
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us._crit_edge.._crit_edge.us_crit_edge

._crit_edge.us._crit_edge.._crit_edge.us_crit_edge: ; preds = %._crit_edge.us._crit_edge
  br label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge.._crit_edge.us_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond10, label %._crit_edge3.us, label %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge

._crit_edge.us.._crit_edge.us._crit_edge_crit_edge: ; preds = %._crit_edge.us
  br label %._crit_edge.us._crit_edge

._crit_edge3.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond, label %._crit_edge5, label %._crit_edge3.us..preheader.us_crit_edge

._crit_edge3.us..preheader.us_crit_edge:          ; preds = %._crit_edge3.us
  br label %.preheader.us

._crit_edge5:                                     ; preds = %._crit_edge3.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
