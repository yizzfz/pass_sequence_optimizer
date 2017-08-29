; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
.preheader10.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %.preheader10.lr.ph, %._crit_edge18.us
  %indvars.iv719.us = phi i64 [ %indvars.iv.next8.us, %._crit_edge18.us ], [ 0, %.preheader10.lr.ph ]
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27, %.preheader10.us
  %indvars.iv516.us = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next6.us, %._crit_edge27 ]
  %7 = mul nuw nsw i64 %indvars.iv516.us, %indvars.iv719.us
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv719.us, i64 %indvars.iv516.us
  %13 = add nuw nsw i64 %7, 2
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1000
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.000000e+03>
  %20 = extractelement <2 x double> %19, i32 0
  %21 = extractelement <2 x double> %19, i32 1
  store double %20, double* %12, align 8
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv719.us, i64 %indvars.iv516.us
  store double %21, double* %22, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv516.us, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond24, label %._crit_edge18.us, label %._crit_edge27

._crit_edge18.us:                                 ; preds = %._crit_edge27
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv719.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next8.us, 1200
  br i1 %exitcond25, label %.preheader.preheader, label %.preheader10.us

.preheader.preheader:                             ; preds = %._crit_edge18.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv313 = phi i64 [ %indvars.iv.next4, %._crit_edge ], [ 0, %.preheader.preheader ]
  br label %._crit_edge28

._crit_edge28:                                    ; preds = %._crit_edge28, %.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge28 ]
  %23 = mul nuw nsw i64 %indvars.iv12, %indvars.iv313
  %24 = add nuw nsw i64 %23, 3
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 1200
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv313, i64 %indvars.iv12
  store double %28, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge28

._crit_edge:                                      ; preds = %._crit_edge28
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv313, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond23, label %._crit_edge15, label %.preheader

._crit_edge15:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]* readonly, [1000 x double]* readonly) unnamed_addr #2 {
.preheader18.lr.ph:
  %7 = insertelement <2 x double> undef, double %3, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader18.us

.preheader18.us:                                  ; preds = %._crit_edge.us, %.preheader18.lr.ph
  %indvars.iv = phi i2 [ %indvars.iv.next, %._crit_edge.us ], [ 1, %.preheader18.lr.ph ]
  %indvars.iv1324.us = phi i64 [ %indvars.iv.next14.us, %._crit_edge.us ], [ 1, %.preheader18.lr.ph ]
  %indvars.iv1522.us = phi i64 [ %14, %._crit_edge.us ], [ 0, %.preheader18.lr.ph ]
  %9 = add nsw i64 %indvars.iv1522.us, -3
  %10 = zext i2 %indvars.iv to i64
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 0
  %11 = mul nuw nsw i64 %indvars.iv1522.us, 1201
  %12 = add nuw nsw i64 %11, 1
  %scevgep43 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %12
  %13 = add nuw nsw i64 %indvars.iv1522.us, 1
  %14 = add nuw nsw i64 %indvars.iv1522.us, 1
  %xtraiter = and i64 %14, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader18.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us.prol
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %3
  store double %17, double* %15, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader18.us
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader18.us ], [ %10, %.prol.loopexit.loopexit ]
  %18 = icmp ult i64 %indvars.iv1522.us, 3
  br i1 %18, label %.preheader.us.preheader, label %.preheader18.us.new.preheader

.preheader18.us.new.preheader:                    ; preds = %.prol.loopexit
  %19 = sub i64 %9, %indvars.iv19.us.unr
  %20 = lshr i64 %19, 2
  %21 = and i64 %20, 1
  %lcmp.mod70 = icmp eq i64 %21, 0
  br i1 %lcmp.mod70, label %.preheader18.us.new.prol.preheader, label %.preheader18.us.new.prol.loopexit.unr-lcssa

.preheader18.us.new.prol.preheader:               ; preds = %.preheader18.us.new.preheader
  br label %.preheader18.us.new.prol

.preheader18.us.new.prol:                         ; preds = %.preheader18.us.new.prol.preheader
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us.unr
  %23 = bitcast double* %22 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = fmul <2 x double> %24, %8
  store <2 x double> %25, <2 x double>* %23, align 8
  %indvars.iv.next.us.1.prol = add nuw nsw i64 %indvars.iv19.us.unr, 2
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.1.prol
  %27 = bitcast double* %26 to <2 x double>*
  %28 = load <2 x double>, <2 x double>* %27, align 8
  %29 = fmul <2 x double> %28, %8
  store <2 x double> %29, <2 x double>* %27, align 8
  %indvars.iv.next.us.3.prol = or i64 %indvars.iv19.us.unr, 4
  br label %.preheader18.us.new.prol.loopexit.unr-lcssa

.preheader18.us.new.prol.loopexit.unr-lcssa:      ; preds = %.preheader18.us.new.preheader, %.preheader18.us.new.prol
  %indvars.iv19.us.unr72.ph = phi i64 [ %indvars.iv.next.us.3.prol, %.preheader18.us.new.prol ], [ %indvars.iv19.us.unr, %.preheader18.us.new.preheader ]
  br label %.preheader18.us.new.prol.loopexit

.preheader18.us.new.prol.loopexit:                ; preds = %.preheader18.us.new.prol.loopexit.unr-lcssa
  %30 = icmp eq i64 %20, 0
  br i1 %30, label %.preheader.us.preheader.loopexit, label %.preheader18.us.new.preheader.new

.preheader18.us.new.preheader.new:                ; preds = %.preheader18.us.new.prol.loopexit
  br label %.preheader18.us.new

.preheader18.us.new:                              ; preds = %.preheader18.us.new, %.preheader18.us.new.preheader.new
  %indvars.iv19.us = phi i64 [ %indvars.iv19.us.unr72.ph, %.preheader18.us.new.preheader.new ], [ %indvars.iv.next.us.3.1, %.preheader18.us.new ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv19.us
  %32 = bitcast double* %31 to <2 x double>*
  %33 = load <2 x double>, <2 x double>* %32, align 8
  %34 = fmul <2 x double> %33, %8
  store <2 x double> %34, <2 x double>* %32, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.1
  %36 = bitcast double* %35 to <2 x double>*
  %37 = load <2 x double>, <2 x double>* %36, align 8
  %38 = fmul <2 x double> %37, %8
  store <2 x double> %38, <2 x double>* %36, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv19.us, 4
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.3
  %40 = bitcast double* %39 to <2 x double>*
  %41 = load <2 x double>, <2 x double>* %40, align 8
  %42 = fmul <2 x double> %41, %8
  store <2 x double> %42, <2 x double>* %40, align 8
  %indvars.iv.next.us.1.1 = add nsw i64 %indvars.iv19.us, 6
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv.next.us.1.1
  %44 = bitcast double* %43 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %44, align 8
  %46 = fmul <2 x double> %45, %8
  store <2 x double> %46, <2 x double>* %44, align 8
  %indvars.iv.next.us.3.1 = add nsw i64 %indvars.iv19.us, 8
  %exitcond.us.3.1 = icmp eq i64 %indvars.iv.next.us.3.1, %indvars.iv1324.us
  br i1 %exitcond.us.3.1, label %.preheader.us.preheader.loopexit.unr-lcssa, label %.preheader18.us.new

.preheader.us.preheader.loopexit.unr-lcssa:       ; preds = %.preheader18.us.new
  br label %.preheader.us.preheader.loopexit

.preheader.us.preheader.loopexit:                 ; preds = %.preheader18.us.new.prol.loopexit, %.preheader.us.preheader.loopexit.unr-lcssa
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %.prol.loopexit
  %min.iters.check = icmp ult i64 %13, 2
  %n.vec = and i64 %13, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %13, %n.vec
  br label %.preheader.us

._crit_edge37:                                    ; preds = %._crit_edge37.preheader, %._crit_edge37
  %indvars.iv520.us = phi i64 [ %indvars.iv.next6.us, %._crit_edge37 ], [ %indvars.iv520.us.ph, %._crit_edge37.preheader ]
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv520.us, i64 %indvars.iv1121.us
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %2
  %50 = load double, double* %62, align 8
  %51 = fmul double %49, %50
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv520.us, i64 %indvars.iv1121.us
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %2
  %55 = load double, double* %63, align 8
  %56 = fmul double %54, %55
  %57 = fadd double %51, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %indvars.iv520.us
  %59 = load double, double* %58, align 8
  %60 = fadd double %59, %57
  store double %60, double* %58, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv520.us, 1
  %exitcond10.us = icmp eq i64 %indvars.iv.next6.us, %indvars.iv1324.us
  br i1 %exitcond10.us, label %.loopexit.loopexit, label %._crit_edge37, !llvm.loop !3

.loopexit.loopexit:                               ; preds = %._crit_edge37
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1121.us, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next12.us, 1000
  br i1 %exitcond28, label %._crit_edge.us, label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit
  %indvars.iv1121.us = phi i64 [ %indvars.iv.next12.us, %.loopexit ], [ 0, %.preheader.us.preheader ]
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1121.us
  %61 = add nuw nsw i64 %indvars.iv1121.us, 1
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %61
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv1121.us
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv1522.us, i64 %61
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1522.us, i64 %indvars.iv1121.us
  br i1 %min.iters.check, label %._crit_edge37.preheader, label %min.iters.checked

._crit_edge37.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv520.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %._crit_edge37

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %._crit_edge37.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %63
  %bound1 = icmp ult double* %63, %scevgep43
  %found.conflict = and i1 %bound0, %bound1
  %bound054 = icmp ult double* %scevgep, %scevgep47
  %bound155 = icmp ult double* %scevgep45, %scevgep43
  %found.conflict56 = and i1 %bound054, %bound155
  %conflict.rdx = or i1 %found.conflict, %found.conflict56
  %bound057 = icmp ult double* %scevgep, %scevgep51
  %bound158 = icmp ult double* %scevgep49, %scevgep43
  %found.conflict59 = and i1 %bound057, %bound158
  %conflict.rdx60 = or i1 %conflict.rdx, %found.conflict59
  %bound063 = icmp ult double* %scevgep, %62
  %bound164 = icmp ult double* %62, %scevgep43
  %found.conflict65 = and i1 %bound063, %bound164
  %conflict.rdx66 = or i1 %conflict.rdx60, %found.conflict65
  br i1 %conflict.rdx66, label %._crit_edge37.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %64 = or i64 %index, 1
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv1121.us
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %64, i64 %indvars.iv1121.us
  %67 = load double, double* %65, align 8, !alias.scope !6
  %68 = load double, double* %66, align 8, !alias.scope !6
  %69 = insertelement <2 x double> undef, double %67, i32 0
  %70 = insertelement <2 x double> %69, double %68, i32 1
  %71 = fmul <2 x double> %70, %broadcast.splat68
  %72 = load double, double* %62, align 8, !alias.scope !9
  %73 = insertelement <2 x double> undef, double %72, i32 0
  %74 = shufflevector <2 x double> %73, <2 x double> undef, <2 x i32> zeroinitializer
  %75 = fmul <2 x double> %71, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv1121.us
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %64, i64 %indvars.iv1121.us
  %78 = load double, double* %76, align 8, !alias.scope !11
  %79 = load double, double* %77, align 8, !alias.scope !11
  %80 = insertelement <2 x double> undef, double %78, i32 0
  %81 = insertelement <2 x double> %80, double %79, i32 1
  %82 = fmul <2 x double> %81, %broadcast.splat68
  %83 = load double, double* %63, align 8, !alias.scope !13
  %84 = insertelement <2 x double> undef, double %83, i32 0
  %85 = shufflevector <2 x double> %84, <2 x double> undef, <2 x i32> zeroinitializer
  %86 = fmul <2 x double> %82, %85
  %87 = fadd <2 x double> %75, %86
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1522.us, i64 %index
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !15, !noalias !17
  %90 = fadd <2 x double> %wide.load, %87
  %91 = bitcast double* %88 to <2 x double>*
  store <2 x double> %90, <2 x double>* %91, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %92 = icmp eq i64 %index.next, %n.vec
  br i1 %92, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.loopexit, label %._crit_edge37.preheader

._crit_edge.us:                                   ; preds = %.loopexit
  %exitcond29 = icmp eq i64 %14, 1200
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1324.us, 1
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %exitcond29, label %._crit_edge26, label %.preheader18.us

._crit_edge26:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv26 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next3, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv26, 1200
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge11 ]
  %7 = add nuw nsw i64 %indvars.iv5, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %._crit_edge12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge12

._crit_edge:                                      ; preds = %._crit_edge11
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond10, label %._crit_edge8, label %.preheader

._crit_edge8:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!14, !7, !12, !10}
!18 = distinct !{!18, !4, !5}
