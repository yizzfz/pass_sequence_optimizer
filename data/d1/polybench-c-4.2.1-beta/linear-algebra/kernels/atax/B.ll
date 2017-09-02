; ModuleID = 'A.ll'
source_filename = "atax.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2100, double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = sitofp i32 %1 to double
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.lr.ph9.preheader, label %.preheader2

.lr.ph9.preheader:                                ; preds = %4
  %xtraiter19 = and i32 %1, 1
  %lcmp.mod20 = icmp eq i32 %xtraiter19, 0
  br i1 %lcmp.mod20, label %.lr.ph9.prol.loopexit, label %.lr.ph9.prol

.lr.ph9.prol:                                     ; preds = %.lr.ph9.preheader
  %7 = fdiv double 0.000000e+00, %5
  %8 = fadd double %7, 1.000000e+00
  store double %8, double* %3, align 8
  br label %.lr.ph9.prol.loopexit

.lr.ph9.prol.loopexit:                            ; preds = %.lr.ph9.preheader, %.lr.ph9.prol
  %indvars.iv15.unr = phi i64 [ 0, %.lr.ph9.preheader ], [ 1, %.lr.ph9.prol ]
  %9 = icmp eq i32 %1, 1
  br i1 %9, label %.preheader2, label %.lr.ph9.preheader21

.lr.ph9.preheader21:                              ; preds = %.lr.ph9.prol.loopexit
  %wide.trip.count17.1 = zext i32 %1 to i64
  br label %.lr.ph9

.preheader2.loopexit:                             ; preds = %.lr.ph9
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %.lr.ph9.prol.loopexit, %4
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader.lr.ph, label %._crit_edge6

.preheader.lr.ph:                                 ; preds = %.preheader2
  %11 = icmp sgt i32 %1, 0
  %12 = mul nsw i32 %0, 5
  %13 = sitofp i32 %12 to double
  br i1 %11, label %.preheader.us.preheader, label %._crit_edge6

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %14 = icmp eq i32 %1, 1
  %wide.trip.count13 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %15 = trunc i64 %indvars.iv11 to i32
  %16 = srem i32 %15, %1
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %13
  %19 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 0
  store double %18, double* %19, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %14, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %20 = add nuw nsw i64 %indvars.iv, %indvars.iv11
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %13
  %25 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  store double %24, double* %25, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = add nuw nsw i64 %indvars.iv.next, %indvars.iv11
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %13
  %31 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next
  store double %30, double* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond, label %._crit_edge6.loopexit, label %.preheader.us

.lr.ph9:                                          ; preds = %.lr.ph9.preheader21, %.lr.ph9
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.lr.ph9 ], [ %indvars.iv15.unr, %.lr.ph9.preheader21 ]
  %32 = trunc i64 %indvars.iv15 to i32
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %5
  %35 = fadd double %34, 1.000000e+00
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv15
  store double %35, double* %36, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %37 = trunc i64 %indvars.iv.next16 to i32
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %5
  %40 = fadd double %39, 1.000000e+00
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next16
  store double %40, double* %41, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, %wide.trip.count17.1
  br i1 %exitcond18.1, label %.preheader2.loopexit, label %.lr.ph9

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.preheader.lr.ph, %.preheader2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32, i32, [2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %7 = bitcast double* %5 to i8*
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.preheader3.loopexit, label %.preheader3

.preheader3.loopexit:                             ; preds = %6
  %9 = bitcast double* %4 to i8*
  %10 = add i32 %1, -1
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nuw nsw i64 %12, 8
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %13, i32 8, i1 false)
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %6
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %.preheader3
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %1, 0
  br i1 %15, label %.lr.ph8.split.us.preheader, label %._crit_edge9.loopexit21

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %17 = add i32 %1, -1
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %18 = icmp eq i32 %17, 0
  %xtraiter25 = and i32 %1, 1
  %lcmp.mod26 = icmp eq i32 %xtraiter25, 0
  %19 = icmp eq i32 %17, 0
  %wide.trip.count24.1 = zext i32 %1 to i64
  %wide.trip.count31 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %20 = add nsw i64 %wide.trip.count24.1, -2
  %scevgep43 = getelementptr double, double* %4, i64 2
  %21 = add nsw i64 %wide.trip.count24.1, -2
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv29 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next30, %._crit_edge.us ]
  %scevgep49 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 2
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv29
  store double 0.000000e+00, double* %22, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph8.split.us
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 0
  %25 = load double, double* %24, align 8
  %26 = load double, double* %3, align 8
  %27 = fmul double %25, %26
  %28 = fadd double %23, %27
  store double %28, double* %22, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph8.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph8.split.us ]
  br i1 %18, label %..preheader_crit_edge.us, label %.lr.ph8.split.us.new.preheader

.lr.ph8.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph8.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph6.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block, %.lr.ph6.us.prol.loopexit, %..preheader_crit_edge.us
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, %wide.trip.count31
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader60, %.lr.ph6.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.lr.ph6.us ], [ %indvars.iv22.ph, %.lr.ph6.us.preheader60 ]
  %29 = getelementptr inbounds double, double* %4, i64 %indvars.iv22
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv22
  %32 = load double, double* %31, align 8
  %33 = load double, double* %22, align 8
  %34 = fmul double %32, %33
  %35 = fadd double %30, %34
  store double %35, double* %29, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %36 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next23
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next23
  %39 = load double, double* %38, align 8
  %40 = load double, double* %22, align 8
  %41 = fmul double %39, %40
  %42 = fadd double %37, %41
  store double %42, double* %36, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.128 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count24.1
  br i1 %exitcond.128, label %._crit_edge.us.loopexit, label %.lr.ph6.us, !llvm.loop !1

.lr.ph8.split.us.new:                             ; preds = %.lr.ph8.split.us.new.preheader, %.lr.ph8.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph8.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph8.split.us.new.preheader ]
  %43 = load double, double* %22, align 8
  %44 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = fadd double %43, %48
  store double %49, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %49, %54
  store double %55, double* %22, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %..preheader_crit_edge.us.loopexit, label %.lr.ph8.split.us.new

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph8.split.us.new
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit
  br i1 %16, label %.lr.ph6.us.preheader, label %._crit_edge.us

.lr.ph6.us.preheader:                             ; preds = %..preheader_crit_edge.us
  br i1 %lcmp.mod26, label %.lr.ph6.us.prol.loopexit, label %.lr.ph6.us.prol

.lr.ph6.us.prol:                                  ; preds = %.lr.ph6.us.preheader
  %56 = load double, double* %4, align 8
  %57 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 0
  %58 = load double, double* %57, align 8
  %59 = load double, double* %22, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %56, %60
  store double %61, double* %4, align 8
  br label %.lr.ph6.us.prol.loopexit

.lr.ph6.us.prol.loopexit:                         ; preds = %.lr.ph6.us.prol, %.lr.ph6.us.preheader
  %indvars.iv22.unr.ph = phi i64 [ 1, %.lr.ph6.us.prol ], [ 0, %.lr.ph6.us.preheader ]
  br i1 %19, label %._crit_edge.us, label %.lr.ph6.us.preheader41

.lr.ph6.us.preheader41:                           ; preds = %.lr.ph6.us.prol.loopexit
  %62 = sub nsw i64 %20, %indvars.iv22.unr.ph
  %63 = lshr i64 %62, 1
  %64 = add nuw i64 %63, 1
  %min.iters.check = icmp ult i64 %64, 2
  br i1 %min.iters.check, label %.lr.ph6.us.preheader60, label %min.iters.checked

.lr.ph6.us.preheader60:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph6.us.preheader41
  %indvars.iv22.ph = phi i64 [ %indvars.iv22.unr.ph, %vector.memcheck ], [ %indvars.iv22.unr.ph, %min.iters.checked ], [ %indvars.iv22.unr.ph, %.lr.ph6.us.preheader41 ], [ %ind.end, %middle.block ]
  br label %.lr.ph6.us

min.iters.checked:                                ; preds = %.lr.ph6.us.preheader41
  %n.mod.vf = and i64 %64, 1
  %n.vec = sub i64 %64, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph6.us.preheader60, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %4, i64 %indvars.iv22.unr.ph
  %65 = sub nsw i64 %21, %indvars.iv22.unr.ph
  %66 = and i64 %65, -2
  %67 = or i64 %indvars.iv22.unr.ph, %66
  %scevgep44 = getelementptr double, double* %scevgep43, i64 %67
  %scevgep47 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv22.unr.ph
  %scevgep50 = getelementptr double, double* %scevgep49, i64 %67
  %bound0 = icmp ult double* %scevgep, %scevgep50
  %bound1 = icmp ult double* %scevgep47, %scevgep44
  %found.conflict = and i1 %bound0, %bound1
  %bound053 = icmp ult double* %scevgep, %22
  %bound154 = icmp ult double* %22, %scevgep44
  %found.conflict55 = and i1 %bound053, %bound154
  %conflict.rdx = or i1 %found.conflict, %found.conflict55
  %68 = or i64 %indvars.iv22.unr.ph, 2
  %69 = shl nuw i64 %63, 1
  %70 = add i64 %68, %69
  %71 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %70, %71
  br i1 %conflict.rdx, label %.lr.ph6.us.preheader60, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %72 = load double, double* %22, align 8, !alias.scope !4
  %73 = insertelement <2 x double> undef, double %72, i32 0
  %74 = shufflevector <2 x double> %73, <2 x double> undef, <2 x i32> zeroinitializer
  %75 = load double, double* %22, align 8, !alias.scope !4
  %76 = insertelement <2 x double> undef, double %75, i32 0
  %77 = shufflevector <2 x double> %76, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %78 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv22.unr.ph, %78
  %79 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %80 = bitcast double* %79 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %80, align 8, !alias.scope !7, !noalias !9
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec56 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %81 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %offset.idx
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec57 = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !11
  %strided.vec58 = shufflevector <4 x double> %wide.vec57, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec59 = shufflevector <4 x double> %wide.vec57, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = fmul <2 x double> %strided.vec58, %74
  %84 = fadd <2 x double> %strided.vec, %83
  %85 = add nuw nsw i64 %offset.idx, 1
  %86 = getelementptr inbounds double, double* %4, i64 %85
  %87 = fmul <2 x double> %strided.vec59, %77
  %88 = fadd <2 x double> %strided.vec56, %87
  %89 = getelementptr double, double* %86, i64 -1
  %90 = bitcast double* %89 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %84, <2 x double> %88, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %90, align 8, !alias.scope !7, !noalias !9
  %index.next = add i64 %index, 2
  %91 = icmp eq i64 %index.next, %n.vec
  br i1 %91, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.lr.ph6.us.preheader60

._crit_edge9.loopexit21:                          ; preds = %.lr.ph8
  %92 = add i32 %0, -1
  %93 = zext i32 %92 to i64
  %94 = shl nuw nsw i64 %93, 3
  %95 = add nuw nsw i64 %94, 8
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %95, i32 8, i1 false)
  br label %._crit_edge9

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge9.loopexit21, %.preheader3
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
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10, !5}
!10 = distinct !{!10, !6}
!11 = !{!10}
!12 = distinct !{!12, !2, !3}
