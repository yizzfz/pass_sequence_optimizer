; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader35.lr.ph, label %._crit_edge39

.preheader35.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  %11 = sitofp i32 %1 to double
  br i1 %9, label %.preheader35.us.preheader, label %.preheader35.lr.ph..preheader.lr.ph_crit_edge

.preheader35.lr.ph..preheader.lr.ph_crit_edge:    ; preds = %.preheader35.lr.ph
  %.pre = zext i32 %0 to i64
  br label %.preheader.lr.ph

.preheader35.us.preheader:                        ; preds = %.preheader35.lr.ph
  %wide.trip.count52 = zext i32 %1 to i64
  %wide.trip.count56 = zext i32 %0 to i64
  br label %.preheader35.us

.preheader35.us:                                  ; preds = %.preheader35.us.preheader, %._crit_edge42.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge42.us ], [ 0, %.preheader35.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader35.us
  %indvars.iv50 = phi i64 [ 0, %.preheader35.us ], [ %indvars.iv.next51, %12 ]
  %13 = mul nuw nsw i64 %indvars.iv50, %indvars.iv54
  %14 = add nuw nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv54, i64 %indvars.iv50
  store double %18, double* %19, align 8
  %20 = add nuw nsw i64 %13, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %11
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv54, i64 %indvars.iv50
  store double %24, double* %25, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge42.us, label %12

._crit_edge42.us:                                 ; preds = %12
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %.preheader.lr.ph.loopexit, label %.preheader35.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge42.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader35.lr.ph..preheader.lr.ph_crit_edge
  %wide.trip.count.pre-phi = phi i64 [ %.pre, %.preheader35.lr.ph..preheader.lr.ph_crit_edge ], [ %wide.trip.count56, %.preheader.lr.ph.loopexit ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %26

; <label>:26:                                     ; preds = %26, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %26 ]
  %27 = mul nuw nsw i64 %indvars.iv, %indvars.iv46
  %28 = add nuw nsw i64 %27, 3
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %0
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %11
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %._crit_edge.us, label %26

._crit_edge.us:                                   ; preds = %26
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count.pre-phi
  br i1 %exitcond49, label %._crit_edge39.loopexit, label %.preheader.us

._crit_edge39.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader35.lr.ph, label %._crit_edge44

.preheader35.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader35.lr.ph
  %wide.trip.count86 = zext i32 %0 to i64
  %broadcast.splatinsert93 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat94 = shufflevector <2 x double> %broadcast.splatinsert93, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader35.lr.ph
  %wide.trip.count63 = zext i32 %1 to i64
  %wide.trip.count70 = zext i32 %0 to i64
  %broadcast.splatinsert137 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat138 = shufflevector <2 x double> %broadcast.splatinsert137, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert162 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat163 = shufflevector <2 x double> %broadcast.splatinsert162, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader165, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader165 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv66
  br i1 %exitcond.3, label %.preheader.us46.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us46.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us46.preheader

.preheader.us46.preheader:                        ; preds = %.preheader.us46.preheader.loopexit, %middle.block140, %.prol.loopexit
  %min.iters.check98 = icmp ult i64 %75, 2
  %n.vec101 = and i64 %75, -2
  %cmp.zero102 = icmp eq i64 %n.vec101, 0
  %cmp.n133 = icmp eq i64 %75, %n.vec101
  br label %.preheader.us46

scalar.ph97:                                      ; preds = %scalar.ph97.preheader, %scalar.ph97
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %scalar.ph97 ], [ %indvars.iv56.ph, %scalar.ph97.preheader ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv56, i64 %indvars.iv61
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %2
  %25 = load double, double* %37, align 8
  %26 = fmul double %24, %25
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv56, i64 %indvars.iv61
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %2
  %30 = load double, double* %38, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %26, %31
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv56
  %34 = load double, double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, %indvars.iv66
  br i1 %exitcond, label %._crit_edge.us49.loopexit, label %scalar.ph97, !llvm.loop !5

.preheader.us46:                                  ; preds = %.preheader.us46.preheader, %._crit_edge.us49
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us49 ], [ 0, %.preheader.us46.preheader ]
  %scevgep107 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv61
  %36 = add nuw nsw i64 %indvars.iv61, 1
  %scevgep109 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %36
  %scevgep111 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv61
  %scevgep113 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %36
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv61
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv68, i64 %indvars.iv61
  br i1 %min.iters.check98, label %scalar.ph97.preheader, label %min.iters.checked99

scalar.ph97.preheader:                            ; preds = %middle.block96, %vector.memcheck, %min.iters.checked99, %.preheader.us46
  %indvars.iv56.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked99 ], [ 0, %.preheader.us46 ], [ %n.vec101, %middle.block96 ]
  br label %scalar.ph97

min.iters.checked99:                              ; preds = %.preheader.us46
  br i1 %cmp.zero102, label %scalar.ph97.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked99
  %bound0 = icmp ult double* %scevgep, %38
  %bound1 = icmp ult double* %38, %scevgep105
  %found.conflict = and i1 %bound0, %bound1
  %bound0116 = icmp ult double* %scevgep, %scevgep109
  %bound1117 = icmp ult double* %scevgep107, %scevgep105
  %found.conflict118 = and i1 %bound0116, %bound1117
  %conflict.rdx = or i1 %found.conflict, %found.conflict118
  %bound0119 = icmp ult double* %scevgep, %scevgep113
  %bound1120 = icmp ult double* %scevgep111, %scevgep105
  %found.conflict121 = and i1 %bound0119, %bound1120
  %conflict.rdx122 = or i1 %conflict.rdx, %found.conflict121
  %bound0125 = icmp ult double* %scevgep, %37
  %bound1126 = icmp ult double* %37, %scevgep105
  %found.conflict127 = and i1 %bound0125, %bound1126
  %conflict.rdx128 = or i1 %conflict.rdx122, %found.conflict127
  br i1 %conflict.rdx128, label %scalar.ph97.preheader, label %vector.ph129

vector.ph129:                                     ; preds = %vector.memcheck
  %39 = load double, double* %37, align 8, !alias.scope !6
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = load double, double* %38, align 8, !alias.scope !9
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body95

vector.body95:                                    ; preds = %vector.body95, %vector.ph129
  %index130 = phi i64 [ 0, %vector.ph129 ], [ %index.next131, %vector.body95 ]
  %45 = or i64 %index130, 1
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index130, i64 %indvars.iv61
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %45, i64 %indvars.iv61
  %48 = load double, double* %46, align 8, !alias.scope !11
  %49 = load double, double* %47, align 8, !alias.scope !11
  %50 = insertelement <2 x double> undef, double %48, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  %52 = fmul <2 x double> %51, %broadcast.splat138
  %53 = fmul <2 x double> %52, %41
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index130, i64 %indvars.iv61
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %45, i64 %indvars.iv61
  %56 = load double, double* %54, align 8, !alias.scope !13
  %57 = load double, double* %55, align 8, !alias.scope !13
  %58 = insertelement <2 x double> undef, double %56, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  %60 = fmul <2 x double> %59, %broadcast.splat138
  %61 = fmul <2 x double> %60, %44
  %62 = fadd <2 x double> %53, %61
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %index130
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !15, !noalias !17
  %65 = fadd <2 x double> %wide.load, %62
  %66 = bitcast double* %63 to <2 x double>*
  store <2 x double> %65, <2 x double>* %66, align 8, !alias.scope !15, !noalias !17
  %index.next131 = add i64 %index130, 2
  %67 = icmp eq i64 %index.next131, %n.vec101
  br i1 %67, label %middle.block96, label %vector.body95, !llvm.loop !18

middle.block96:                                   ; preds = %vector.body95
  br i1 %cmp.n133, label %._crit_edge.us49, label %scalar.ph97.preheader

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %._crit_edge40.us
  %indvars.iv168 = phi i2 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next169, %._crit_edge40.us ]
  %indvars.iv68 = phi i64 [ 0, %.lr.ph.us.preheader ], [ %indvars.iv.next69, %._crit_edge40.us ]
  %indvars.iv66 = phi i64 [ 1, %.lr.ph.us.preheader ], [ %indvars.iv.next67, %._crit_edge40.us ]
  %68 = zext i2 %indvars.iv168 to i64
  %69 = add nuw nsw i64 %68, 4294967295
  %70 = and i64 %69, 4294967295
  %71 = add nuw nsw i64 %70, 1
  %72 = add nsw i64 %indvars.iv68, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 0
  %73 = mul i64 %indvars.iv68, 1201
  %74 = add i64 %73, 1
  %scevgep105 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %74
  %75 = add nuw nsw i64 %indvars.iv68, 1
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %76 = trunc i64 %indvars.iv.next69 to i32
  %xtraiter = and i32 %76, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv.prol
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %3
  store double %79, double* %77, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !19

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %71, %.prol.loopexit.loopexit ]
  %80 = icmp ult i64 %indvars.iv68, 3
  br i1 %80, label %.preheader.us46.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %81 = sub i64 %72, %indvars.iv.unr
  %82 = lshr i64 %81, 2
  %83 = add nuw nsw i64 %82, 1
  %min.iters.check142 = icmp ult i64 %83, 2
  br i1 %min.iters.check142, label %.lr.ph.us.new.preheader165, label %min.iters.checked143

.lr.ph.us.new.preheader165:                       ; preds = %middle.block140, %min.iters.checked143, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked143 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end151, %middle.block140 ]
  br label %.lr.ph.us.new

min.iters.checked143:                             ; preds = %.lr.ph.us.new.preheader
  %n.mod.vf144 = and i64 %83, 1
  %n.vec145 = sub nsw i64 %83, %n.mod.vf144
  %cmp.zero146 = icmp eq i64 %n.vec145, 0
  %84 = add nsw i64 %indvars.iv.unr, 4
  %85 = shl nuw i64 %82, 2
  %86 = add i64 %84, %85
  %87 = shl nuw nsw i64 %n.mod.vf144, 2
  %ind.end151 = sub i64 %86, %87
  br i1 %cmp.zero146, label %.lr.ph.us.new.preheader165, label %vector.ph147

vector.ph147:                                     ; preds = %min.iters.checked143
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139, %vector.ph147
  %index148 = phi i64 [ 0, %vector.ph147 ], [ %index.next149, %vector.body139 ]
  %88 = shl i64 %index148, 2
  %89 = add i64 %indvars.iv.unr, %88
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %89
  %91 = bitcast double* %90 to <8 x double>*
  %wide.vec157 = load <8 x double>, <8 x double>* %91, align 8
  %strided.vec158 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec159 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec160 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec161 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %92 = fmul <2 x double> %strided.vec158, %broadcast.splat163
  %93 = fmul <2 x double> %strided.vec159, %broadcast.splat163
  %94 = fmul <2 x double> %strided.vec160, %broadcast.splat163
  %95 = add nsw i64 %89, 3
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %95
  %97 = fmul <2 x double> %strided.vec161, %broadcast.splat163
  %98 = getelementptr double, double* %96, i64 -3
  %99 = bitcast double* %98 to <8 x double>*
  %100 = shufflevector <2 x double> %92, <2 x double> %93, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %101 = shufflevector <2 x double> %94, <2 x double> %97, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec164 = shufflevector <4 x double> %100, <4 x double> %101, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec164, <8 x double>* %99, align 8
  %index.next149 = add i64 %index148, 2
  %102 = icmp eq i64 %index.next149, %n.vec145
  br i1 %102, label %middle.block140, label %vector.body139, !llvm.loop !21

middle.block140:                                  ; preds = %vector.body139
  %cmp.n152 = icmp eq i64 %n.mod.vf144, 0
  br i1 %cmp.n152, label %.preheader.us46.preheader, label %.lr.ph.us.new.preheader165

._crit_edge.us49.loopexit:                        ; preds = %scalar.ph97
  br label %._crit_edge.us49

._crit_edge.us49:                                 ; preds = %._crit_edge.us49.loopexit, %middle.block96
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge40.us, label %.preheader.us46

._crit_edge40.us:                                 ; preds = %._crit_edge.us49
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  %indvars.iv.next169 = add i2 %indvars.iv168, 1
  br i1 %exitcond71, label %._crit_edge44.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.preheader34
  %indvars.iv170 = phi i2 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next171, %.preheader34 ]
  %indvars.iv84 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next85, %.preheader34 ]
  %indvars.iv82 = phi i64 [ 1, %.lr.ph.preheader ], [ %indvars.iv.next83, %.preheader34 ]
  %103 = zext i2 %indvars.iv170 to i64
  %104 = add nuw nsw i64 %103, 4294967295
  %105 = and i64 %104, 4294967295
  %106 = add nuw nsw i64 %105, 1
  %107 = add nsw i64 %indvars.iv84, -3
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %108 = trunc i64 %indvars.iv.next85 to i32
  %xtraiter79 = and i32 %108, 3
  %lcmp.mod80 = icmp eq i32 %xtraiter79, 0
  br i1 %lcmp.mod80, label %.prol.loopexit78, label %.prol.preheader77.preheader

.prol.preheader77.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader77

.prol.preheader77:                                ; preds = %.prol.preheader77.preheader, %.prol.preheader77
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %.prol.preheader77 ], [ 0, %.prol.preheader77.preheader ]
  %prol.iter81 = phi i32 [ %prol.iter81.sub, %.prol.preheader77 ], [ %xtraiter79, %.prol.preheader77.preheader ]
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv72.prol
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %3
  store double %111, double* %109, align 8
  %indvars.iv.next73.prol = add nuw nsw i64 %indvars.iv72.prol, 1
  %prol.iter81.sub = add nsw i32 %prol.iter81, -1
  %prol.iter81.cmp = icmp eq i32 %prol.iter81.sub, 0
  br i1 %prol.iter81.cmp, label %.prol.loopexit78.loopexit, label %.prol.preheader77, !llvm.loop !22

.prol.loopexit78.loopexit:                        ; preds = %.prol.preheader77
  br label %.prol.loopexit78

.prol.loopexit78:                                 ; preds = %.prol.loopexit78.loopexit, %.lr.ph
  %indvars.iv72.unr = phi i64 [ 0, %.lr.ph ], [ %106, %.prol.loopexit78.loopexit ]
  %112 = icmp ult i64 %indvars.iv84, 3
  br i1 %112, label %.preheader34, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit78
  %113 = sub i64 %107, %indvars.iv72.unr
  %114 = lshr i64 %113, 2
  %115 = add nuw nsw i64 %114, 1
  %min.iters.check = icmp ult i64 %115, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader166, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %n.mod.vf = and i64 %115, 1
  %n.vec = sub nsw i64 %115, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %116 = add nsw i64 %indvars.iv72.unr, 4
  %117 = shl nuw i64 %114, 2
  %118 = add i64 %116, %117
  %119 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %118, %119
  br i1 %cmp.zero, label %.lr.ph.new.preheader166, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %120 = shl i64 %index, 2
  %121 = add i64 %indvars.iv72.unr, %120
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %121
  %123 = bitcast double* %122 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %123, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec90 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec91 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec92 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %124 = fmul <2 x double> %strided.vec, %broadcast.splat94
  %125 = fmul <2 x double> %strided.vec90, %broadcast.splat94
  %126 = fmul <2 x double> %strided.vec91, %broadcast.splat94
  %127 = add nsw i64 %121, 3
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %127
  %129 = fmul <2 x double> %strided.vec92, %broadcast.splat94
  %130 = getelementptr double, double* %128, i64 -3
  %131 = bitcast double* %130 to <8 x double>*
  %132 = shufflevector <2 x double> %124, <2 x double> %125, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %133 = shufflevector <2 x double> %126, <2 x double> %129, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %132, <4 x double> %133, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %131, align 8
  %index.next = add i64 %index, 2
  %134 = icmp eq i64 %index.next, %n.vec
  br i1 %134, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader34, label %.lr.ph.new.preheader166

.lr.ph.new.preheader166:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv72.ph = phi i64 [ %indvars.iv72.unr, %min.iters.checked ], [ %indvars.iv72.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader166, %.lr.ph.new
  %indvars.iv72 = phi i64 [ %indvars.iv.next73.3, %.lr.ph.new ], [ %indvars.iv72.ph, %.lr.ph.new.preheader166 ]
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv72
  %136 = load double, double* %135, align 8
  %137 = fmul double %136, %3
  store double %137, double* %135, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73
  %139 = load double, double* %138, align 8
  %140 = fmul double %139, %3
  store double %140, double* %138, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73.1
  %142 = load double, double* %141, align 8
  %143 = fmul double %142, %3
  store double %143, double* %141, align 8
  %indvars.iv.next73.2 = add nsw i64 %indvars.iv72, 3
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84, i64 %indvars.iv.next73.2
  %145 = load double, double* %144, align 8
  %146 = fmul double %145, %3
  store double %146, double* %144, align 8
  %indvars.iv.next73.3 = add nsw i64 %indvars.iv72, 4
  %exitcond76.3 = icmp eq i64 %indvars.iv.next73.3, %indvars.iv82
  br i1 %exitcond76.3, label %.preheader34.loopexit, label %.lr.ph.new, !llvm.loop !24

.preheader34.loopexit:                            ; preds = %.lr.ph.new
  br label %.preheader34

.preheader34:                                     ; preds = %.preheader34.loopexit, %middle.block, %.prol.loopexit78
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, %wide.trip.count86
  %indvars.iv.next171 = add i2 %indvars.iv170, 1
  br i1 %exitcond87, label %._crit_edge44.loopexit167, label %.lr.ph

._crit_edge44.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge44

._crit_edge44.loopexit167:                        ; preds = %.preheader34
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit167, %._crit_edge44.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv14, %8
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %17 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond17, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
