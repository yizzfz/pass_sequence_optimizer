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

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
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

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next24, %._crit_edge11.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1200
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %11, double* %12, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge11.us, label %._crit_edge

._crit_edge11.us:                                 ; preds = %._crit_edge
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond26, label %.preheader.us.preheader, label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge11.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge28 ]
  %13 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %18, double* %19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge28

._crit_edge.us:                                   ; preds = %._crit_edge28
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond18, label %._crit_edge8, label %.preheader.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader4.us.preheader:
  %broadcast.splatinsert65 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat66 = shufflevector <2 x double> %broadcast.splatinsert65, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader67, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader67 ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %3
  store double %8, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %3
  store double %14, double* %12, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next.2
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %3
  store double %17, double* %15, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv36
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us15.new:                              ; preds = %.preheader.us15.new.preheader, %.preheader.us15.new
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.preheader.us15.new ], [ %indvars.iv25.unr.ph, %.preheader.us15.new.preheader ]
  %18 = load double, double* %34, align 8
  %19 = fmul double %18, %2
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv31
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv25
  %24 = load double, double* %23, align 8
  %25 = fadd double %24, %22
  store double %25, double* %23, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %26 = load double, double* %34, align 8
  %27 = fmul double %26, %2
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next26, i64 %indvars.iv31
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.next26
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %exitcond30.1 = icmp eq i64 %indvars.iv.next26.1, %indvars.iv36
  br i1 %exitcond30.1, label %._crit_edge.us18.loopexit, label %.preheader.us15.new

.preheader.us15:                                  ; preds = %._crit_edge.us18, %.preheader.us15.preheader
  %indvars.iv31 = phi i64 [ 0, %.preheader.us15.preheader ], [ %indvars.iv.next32, %._crit_edge.us18 ]
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv38, i64 %indvars.iv31
  br i1 %lcmp.mod56, label %.prol.preheader53, label %.prol.loopexit54

.prol.preheader53:                                ; preds = %.preheader.us15
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %2
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv31
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = load double, double* %71, align 8
  %41 = fadd double %40, %39
  store double %41, double* %71, align 8
  br label %.prol.loopexit54

.prol.loopexit54:                                 ; preds = %.preheader.us15, %.prol.preheader53
  %indvars.iv25.unr.ph = phi i64 [ 1, %.prol.preheader53 ], [ 0, %.preheader.us15 ]
  br i1 %72, label %._crit_edge.us18, label %.preheader.us15.new.preheader

.preheader.us15.new.preheader:                    ; preds = %.prol.loopexit54
  br label %.preheader.us15.new

.lr.ph.us:                                        ; preds = %._crit_edge9.us..lr.ph.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next39, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %indvars.iv36 = phi i64 [ 1, %.preheader4.us.preheader ], [ %indvars.iv.next37, %._crit_edge9.us..lr.ph.us_crit_edge ]
  %42 = add i64 %indvars.iv38, -3
  %43 = add i64 %indvars.iv38, 1
  %xtraiter = and i64 %43, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv.prol
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %3
  store double %46, double* %44, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %47 = icmp ult i64 %indvars.iv38, 3
  br i1 %47, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %48 = sub i64 %42, %indvars.iv.unr
  %49 = lshr i64 %48, 2
  %50 = add nuw nsw i64 %49, 1
  %min.iters.check = icmp ult i64 %50, 2
  br i1 %min.iters.check, label %.lr.ph.us.new.preheader67, label %min.iters.checked

.lr.ph.us.new.preheader67:                        ; preds = %middle.block, %min.iters.checked, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ]
  br label %.lr.ph.us.new

min.iters.checked:                                ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf = and i64 %50, 1
  %n.vec = sub nsw i64 %50, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %51 = add i64 %indvars.iv.unr, 4
  %52 = shl nuw i64 %49, 2
  %53 = add i64 %51, %52
  %54 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %53, %54
  br i1 %cmp.zero, label %.lr.ph.us.new.preheader67, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %55 = shl i64 %index, 2
  %56 = add i64 %indvars.iv.unr, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %56
  %58 = bitcast double* %57 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %58, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec62 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec63 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %59 = fmul <2 x double> %strided.vec, %broadcast.splat66
  %60 = fmul <2 x double> %strided.vec62, %broadcast.splat66
  %61 = fmul <2 x double> %strided.vec63, %broadcast.splat66
  %62 = add nsw i64 %56, 3
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %62
  %64 = fmul <2 x double> %strided.vec64, %broadcast.splat66
  %65 = getelementptr double, double* %63, i64 -3
  %66 = bitcast double* %65 to <8 x double>*
  %67 = shufflevector <2 x double> %59, <2 x double> %60, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %68 = shufflevector <2 x double> %61, <2 x double> %64, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %67, <4 x double> %68, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %66, align 8
  %index.next = add i64 %index, 2
  %69 = icmp eq i64 %index.next, %n.vec
  br i1 %69, label %middle.block, label %vector.body, !llvm.loop !7

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader67

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block, %.prol.loopexit
  %70 = and i64 %indvars.iv38, 1
  %lcmp.mod56 = icmp eq i64 %70, 0
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 0
  %72 = icmp eq i64 %indvars.iv38, 0
  br label %.preheader.us15

._crit_edge.us18.loopexit:                        ; preds = %.preheader.us15.new
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %.prol.loopexit54
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 1200
  br i1 %exitcond41, label %._crit_edge13, label %._crit_edge9.us..lr.ph.us_crit_edge

._crit_edge9.us..lr.ph.us_crit_edge:              ; preds = %._crit_edge9.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  br label %.lr.ph.us

._crit_edge13:                                    ; preds = %._crit_edge9.us
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
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv5, 1200
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge9, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
