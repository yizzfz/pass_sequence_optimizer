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
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br i1 true, label %.preheader4.lr.ph, label %._crit_edge8

.preheader4.lr.ph:                                ; preds = %7
  br i1 true, label %.preheader4.us.preheader, label %.preheader4.lr.ph..preheader.lr.ph_crit_edge

.preheader4.lr.ph..preheader.lr.ph_crit_edge:     ; preds = %.preheader4.lr.ph
  br label %.preheader.lr.ph

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge11.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %8 ]
  %9 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 1200
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.200000e+03
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %14, double* %15, align 8
  %16 = add nuw nsw i64 %9, 2
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1000
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv19
  store double %20, double* %21, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge11.us, label %8

._crit_edge11.us:                                 ; preds = %8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond26, label %.preheader.lr.ph.loopexit, label %.preheader4.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge11.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader4.lr.ph..preheader.lr.ph_crit_edge
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %22

; <label>:22:                                     ; preds = %22, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %22 ]
  %23 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %24 = add nuw nsw i64 %23, 3
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 1200
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %28, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %22

._crit_edge.us:                                   ; preds = %22
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  br i1 true, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %7
  br i1 true, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader4.lr.ph
  %broadcast.splatinsert62 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat63 = shufflevector <2 x double> %broadcast.splatinsert62, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert131 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat132 = shufflevector <2 x double> %broadcast.splatinsert131, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader134, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader134 ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %3
  store double %10, double* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %3
  store double %13, double* %11, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next.1
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %3
  store double %16, double* %14, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next.2
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %3
  store double %19, double* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv35
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block109, %.prol.loopexit
  %min.iters.check67 = icmp ult i64 %69, 2
  %n.vec70 = and i64 %69, -2
  %cmp.zero71 = icmp eq i64 %n.vec70, 0
  %cmp.n102 = icmp eq i64 %69, %n.vec70
  br label %.preheader.us15

scalar.ph66:                                      ; preds = %scalar.ph66.preheader, %scalar.ph66
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph66 ], [ %indvars.iv25.ph, %scalar.ph66.preheader ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv30
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %2
  %23 = load double, double* %35, align 8
  %24 = fmul double %22, %23
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv30
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %2
  %28 = load double, double* %36, align 8
  %29 = fmul double %27, %28
  %30 = fadd double %24, %29
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv25
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %indvars.iv35
  br i1 %exitcond, label %._crit_edge.us18.loopexit, label %scalar.ph66, !llvm.loop !5

.preheader.us15:                                  ; preds = %.preheader.us15.preheader, %._crit_edge.us18
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep76 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv30
  %34 = add i64 %indvars.iv30, 1
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %34
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv30
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %34
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv30
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv30
  br i1 %min.iters.check67, label %scalar.ph66.preheader, label %min.iters.checked68

scalar.ph66.preheader:                            ; preds = %middle.block65, %vector.memcheck, %min.iters.checked68, %.preheader.us15
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked68 ], [ 0, %.preheader.us15 ], [ %n.vec70, %middle.block65 ]
  br label %scalar.ph66

min.iters.checked68:                              ; preds = %.preheader.us15
  br i1 %cmp.zero71, label %scalar.ph66.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked68
  %bound0 = icmp ult double* %scevgep, %36
  %bound1 = icmp ult double* %36, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound085 = icmp ult double* %scevgep, %scevgep78
  %bound186 = icmp ult double* %scevgep76, %scevgep74
  %found.conflict87 = and i1 %bound085, %bound186
  %conflict.rdx = or i1 %found.conflict, %found.conflict87
  %bound088 = icmp ult double* %scevgep, %scevgep82
  %bound189 = icmp ult double* %scevgep80, %scevgep74
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx91 = or i1 %conflict.rdx, %found.conflict90
  %bound094 = icmp ult double* %scevgep, %35
  %bound195 = icmp ult double* %35, %scevgep74
  %found.conflict96 = and i1 %bound094, %bound195
  %conflict.rdx97 = or i1 %conflict.rdx91, %found.conflict96
  br i1 %conflict.rdx97, label %scalar.ph66.preheader, label %vector.ph98

vector.ph98:                                      ; preds = %vector.memcheck
  %37 = load double, double* %35, align 8, !alias.scope !6
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  %40 = load double, double* %36, align 8, !alias.scope !9
  %41 = insertelement <2 x double> undef, double %40, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body64

vector.body64:                                    ; preds = %vector.body64, %vector.ph98
  %index99 = phi i64 [ 0, %vector.ph98 ], [ %index.next100, %vector.body64 ]
  %43 = or i64 %index99, 1
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index99, i64 %indvars.iv30
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %43, i64 %indvars.iv30
  %46 = load double, double* %44, align 8, !alias.scope !11
  %47 = load double, double* %45, align 8, !alias.scope !11
  %48 = insertelement <2 x double> undef, double %46, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fmul <2 x double> %49, %broadcast.splat107
  %51 = fmul <2 x double> %50, %39
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index99, i64 %indvars.iv30
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %43, i64 %indvars.iv30
  %54 = load double, double* %52, align 8, !alias.scope !13
  %55 = load double, double* %53, align 8, !alias.scope !13
  %56 = insertelement <2 x double> undef, double %54, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  %58 = fmul <2 x double> %57, %broadcast.splat107
  %59 = fmul <2 x double> %58, %42
  %60 = fadd <2 x double> %51, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %index99
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !15, !noalias !17
  %63 = fadd <2 x double> %wide.load, %60
  %64 = bitcast double* %61 to <2 x double>*
  store <2 x double> %63, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %index.next100 = add i64 %index99, 2
  %65 = icmp eq i64 %index.next100, %n.vec70
  br i1 %65, label %middle.block65, label %vector.body64, !llvm.loop !18

middle.block65:                                   ; preds = %vector.body64
  br i1 %cmp.n102, label %._crit_edge.us18, label %scalar.ph66.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge9.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge9.us ], [ 1, %.lr.ph.us.preheader ]
  %66 = add i64 %indvars.iv37, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 0
  %67 = mul i64 %indvars.iv37, 1201
  %68 = add i64 %67, 1
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %68
  %69 = add i64 %indvars.iv37, 1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %70 = trunc i64 %indvars.iv.next38 to i32
  %xtraiter = and i32 %70, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.prol
  %72 = load double, double* %71, align 8
  %73 = fmul double %72, %3
  store double %73, double* %71, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %74 = icmp ult i64 %indvars.iv37, 3
  br i1 %74, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %75 = sub i64 %66, %indvars.iv.unr
  %76 = lshr i64 %75, 2
  %77 = add nuw nsw i64 %76, 1
  %min.iters.check111 = icmp ult i64 %77, 2
  br i1 %min.iters.check111, label %.lr.ph.us.new.preheader134, label %min.iters.checked112

.lr.ph.us.new.preheader134:                       ; preds = %middle.block109, %min.iters.checked112, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked112 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end120, %middle.block109 ]
  br label %.lr.ph.us.new

min.iters.checked112:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf113 = and i64 %77, 1
  %n.vec114 = sub nsw i64 %77, %n.mod.vf113
  %cmp.zero115 = icmp eq i64 %n.vec114, 0
  %78 = add i64 %indvars.iv.unr, 4
  %79 = shl nuw i64 %76, 2
  %80 = add i64 %78, %79
  %81 = shl nuw nsw i64 %n.mod.vf113, 2
  %ind.end120 = sub i64 %80, %81
  br i1 %cmp.zero115, label %.lr.ph.us.new.preheader134, label %vector.ph116

vector.ph116:                                     ; preds = %min.iters.checked112
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108, %vector.ph116
  %index117 = phi i64 [ 0, %vector.ph116 ], [ %index.next118, %vector.body108 ]
  %82 = shl i64 %index117, 2
  %83 = add i64 %indvars.iv.unr, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %83
  %85 = bitcast double* %84 to <8 x double>*
  %wide.vec126 = load <8 x double>, <8 x double>* %85, align 8
  %strided.vec127 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec128 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec129 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec130 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %86 = fmul <2 x double> %strided.vec127, %broadcast.splat132
  %87 = fmul <2 x double> %strided.vec128, %broadcast.splat132
  %88 = fmul <2 x double> %strided.vec129, %broadcast.splat132
  %89 = add nsw i64 %83, 3
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %89
  %91 = fmul <2 x double> %strided.vec130, %broadcast.splat132
  %92 = getelementptr double, double* %90, i64 -3
  %93 = bitcast double* %92 to <8 x double>*
  %94 = shufflevector <2 x double> %86, <2 x double> %87, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %95 = shufflevector <2 x double> %88, <2 x double> %91, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec133 = shufflevector <4 x double> %94, <4 x double> %95, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec133, <8 x double>* %93, align 8
  %index.next118 = add i64 %index117, 2
  %96 = icmp eq i64 %index.next118, %n.vec114
  br i1 %96, label %middle.block109, label %vector.body108, !llvm.loop !21

middle.block109:                                  ; preds = %vector.body108
  %cmp.n121 = icmp eq i64 %n.mod.vf113, 0
  br i1 %cmp.n121, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader134

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph66
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block65
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond33, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1200
  br i1 %exitcond40, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader3
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %.preheader3 ], [ 0, %.lr.ph.preheader ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %.preheader3 ], [ 1, %.lr.ph.preheader ]
  %97 = add i64 %indvars.iv53, -3
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %98 = trunc i64 %indvars.iv.next54 to i32
  %xtraiter48 = and i32 %98, 3
  %lcmp.mod49 = icmp eq i32 %xtraiter48, 0
  br i1 %lcmp.mod49, label %.prol.loopexit47, label %.prol.preheader46.preheader

.prol.preheader46.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader46

.prol.preheader46:                                ; preds = %.prol.preheader46.preheader, %.prol.preheader46
  %indvars.iv41.prol = phi i64 [ %indvars.iv.next42.prol, %.prol.preheader46 ], [ 0, %.prol.preheader46.preheader ]
  %prol.iter50 = phi i32 [ %prol.iter50.sub, %.prol.preheader46 ], [ %xtraiter48, %.prol.preheader46.preheader ]
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41.prol
  %100 = load double, double* %99, align 8
  %101 = fmul double %100, %3
  store double %101, double* %99, align 8
  %indvars.iv.next42.prol = add nuw nsw i64 %indvars.iv41.prol, 1
  %prol.iter50.sub = add i32 %prol.iter50, -1
  %prol.iter50.cmp = icmp eq i32 %prol.iter50.sub, 0
  br i1 %prol.iter50.cmp, label %.prol.loopexit47.loopexit, label %.prol.preheader46, !llvm.loop !22

.prol.loopexit47.loopexit:                        ; preds = %.prol.preheader46
  br label %.prol.loopexit47

.prol.loopexit47:                                 ; preds = %.prol.loopexit47.loopexit, %.lr.ph
  %indvars.iv41.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next42.prol, %.prol.loopexit47.loopexit ]
  %102 = icmp ult i64 %indvars.iv53, 3
  br i1 %102, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit47
  %103 = sub i64 %97, %indvars.iv41.unr
  %104 = lshr i64 %103, 2
  %105 = add nuw nsw i64 %104, 1
  %min.iters.check = icmp ult i64 %105, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader135, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %105, 1
  %n.vec = sub nsw i64 %105, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %106 = add i64 %indvars.iv41.unr, 4
  %107 = shl nuw i64 %104, 2
  %108 = add i64 %106, %107
  %109 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %108, %109
  br i1 %cmp.zero, label %.lr.ph.new.preheader135, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %110 = shl i64 %index, 2
  %111 = add i64 %indvars.iv41.unr, %110
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %111
  %113 = bitcast double* %112 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %113, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec59 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec60 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %114 = fmul <2 x double> %strided.vec, %broadcast.splat63
  %115 = fmul <2 x double> %strided.vec59, %broadcast.splat63
  %116 = fmul <2 x double> %strided.vec60, %broadcast.splat63
  %117 = add nsw i64 %111, 3
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %117
  %119 = fmul <2 x double> %strided.vec61, %broadcast.splat63
  %120 = getelementptr double, double* %118, i64 -3
  %121 = bitcast double* %120 to <8 x double>*
  %122 = shufflevector <2 x double> %114, <2 x double> %115, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %123 = shufflevector <2 x double> %116, <2 x double> %119, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %122, <4 x double> %123, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %121, align 8
  %index.next = add i64 %index, 2
  %124 = icmp eq i64 %index.next, %n.vec
  br i1 %124, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader3, label %.lr.ph.new.preheader135

.lr.ph.new.preheader135:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv41.ph = phi i64 [ %indvars.iv41.unr, %min.iters.checked ], [ %indvars.iv41.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader135, %.lr.ph.new
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.3, %.lr.ph.new ], [ %indvars.iv41.ph, %.lr.ph.new.preheader135 ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41
  %126 = load double, double* %125, align 8
  %127 = fmul double %126, %3
  store double %127, double* %125, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42
  %129 = load double, double* %128, align 8
  %130 = fmul double %129, %3
  store double %130, double* %128, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.1
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, %3
  store double %133, double* %131, align 8
  %indvars.iv.next42.2 = add nsw i64 %indvars.iv41, 3
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.2
  %135 = load double, double* %134, align 8
  %136 = fmul double %135, %3
  store double %136, double* %134, align 8
  %indvars.iv.next42.3 = add nsw i64 %indvars.iv41, 4
  %exitcond45.3 = icmp eq i64 %indvars.iv.next42.3, %indvars.iv51
  br i1 %exitcond45.3, label %.preheader3.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit47
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 1200
  br i1 %exitcond56, label %._crit_edge13.loopexit136, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge13

._crit_edge13.loopexit136:                        ; preds = %.preheader3
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit136, %._crit_edge13.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv5, 1200
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!5 = distinct !{!5, !3, !4}
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
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
