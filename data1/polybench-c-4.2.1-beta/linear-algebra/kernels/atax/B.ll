; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call void @print_array(i32 2100, double* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [2100 x double]* nocapture, double* nocapture) #2 {
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

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_atax(i32, i32, [2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture) #2 {
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.preheader3.loopexit, label %.preheader3

.preheader3.loopexit:                             ; preds = %6
  %8 = bitcast double* %4 to i8*
  %9 = add i32 %1, -1
  %10 = zext i32 %9 to i64
  %11 = shl nuw nsw i64 %10, 3
  %12 = add nuw nsw i64 %11, 8
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %12, i32 8, i1 false)
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %6
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %.preheader3
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph8.split.us.preheader, label %._crit_edge9.loopexit21

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %15 = add i32 %1, -1
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %16 = icmp eq i32 %15, 0
  %xtraiter25 = and i32 %1, 1
  %lcmp.mod26 = icmp eq i32 %xtraiter25, 0
  %17 = icmp eq i32 %15, 0
  %sunkaddr44 = ptrtoint double* %5 to i64
  %wide.trip.count24.1 = zext i32 %1 to i64
  %sunkaddr52 = ptrtoint double* %5 to i64
  %wide.trip.count31 = zext i32 %0 to i64
  %sunkaddr48 = ptrtoint double* %5 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %18 = add nsw i64 %wide.trip.count24.1, -2
  %scevgep57 = getelementptr double, double* %4, i64 2
  %19 = add nsw i64 %wide.trip.count24.1, -2
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv29 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next30, %._crit_edge.us ]
  %scevgep63 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 2
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv29
  store double 0.000000e+00, double* %20, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph8.split.us
  %sunkaddr41 = shl i64 %indvars.iv29, 3
  %sunkaddr42 = add i64 %sunkaddr, %sunkaddr41
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to double*
  %21 = load double, double* %sunkaddr43, align 8
  %22 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 0
  %23 = load double, double* %22, align 8
  %24 = load double, double* %3, align 8
  %25 = fmul double %23, %24
  %26 = fadd double %21, %25
  store double %26, double* %sunkaddr43, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph8.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph8.split.us ]
  br i1 %16, label %.lr.ph6.us.preheader, label %.lr.ph8.split.us.new.preheader

.lr.ph8.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %sunkaddr49 = shl i64 %indvars.iv29, 3
  %sunkaddr50 = add i64 %sunkaddr48, %sunkaddr49
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to double*
  br label %.lr.ph8.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph6.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block, %.lr.ph6.us.prol.loopexit
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, %wide.trip.count31
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader74, %.lr.ph6.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.lr.ph6.us ], [ %indvars.iv22.ph, %.lr.ph6.us.preheader74 ]
  %27 = getelementptr inbounds double, double* %4, i64 %indvars.iv22
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv22
  %30 = load double, double* %29, align 8
  %31 = load double, double* %sunkaddr47, align 8
  %32 = fmul double %30, %31
  %33 = fadd double %28, %32
  store double %33, double* %27, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %34 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next23
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next23
  %37 = load double, double* %36, align 8
  %38 = load double, double* %sunkaddr47, align 8
  %39 = fmul double %37, %38
  %40 = fadd double %35, %39
  store double %40, double* %34, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.128 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count24.1
  br i1 %exitcond.128, label %._crit_edge.us.loopexit, label %.lr.ph6.us, !llvm.loop !1

.lr.ph8.split.us.new:                             ; preds = %.lr.ph8.split.us.new.preheader, %.lr.ph8.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph8.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph8.split.us.new.preheader ]
  %41 = load double, double* %sunkaddr51, align 8
  %42 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %41, %46
  store double %47, double* %sunkaddr51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %47, %52
  store double %53, double* %sunkaddr51, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph6.us.preheader.loopexit, label %.lr.ph8.split.us.new

.lr.ph6.us.preheader.loopexit:                    ; preds = %.lr.ph8.split.us.new
  br label %.lr.ph6.us.preheader

.lr.ph6.us.preheader:                             ; preds = %.lr.ph6.us.preheader.loopexit, %.prol.loopexit
  br i1 %lcmp.mod26, label %.lr.ph6.us.prol.loopexit, label %.lr.ph6.us.prol

.lr.ph6.us.prol:                                  ; preds = %.lr.ph6.us.preheader
  %54 = load double, double* %4, align 8
  %55 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 0
  %56 = load double, double* %55, align 8
  %sunkaddr53 = shl i64 %indvars.iv29, 3
  %sunkaddr54 = add i64 %sunkaddr52, %sunkaddr53
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to double*
  %57 = load double, double* %sunkaddr55, align 8
  %58 = fmul double %56, %57
  %59 = fadd double %54, %58
  store double %59, double* %4, align 8
  br label %.lr.ph6.us.prol.loopexit

.lr.ph6.us.prol.loopexit:                         ; preds = %.lr.ph6.us.prol, %.lr.ph6.us.preheader
  %indvars.iv22.unr.ph = phi i64 [ 1, %.lr.ph6.us.prol ], [ 0, %.lr.ph6.us.preheader ]
  br i1 %17, label %._crit_edge.us, label %.lr.ph6.us.preheader40

.lr.ph6.us.preheader40:                           ; preds = %.lr.ph6.us.prol.loopexit
  %sunkaddr45 = shl i64 %indvars.iv29, 3
  %sunkaddr46 = add i64 %sunkaddr44, %sunkaddr45
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to double*
  %60 = sub nsw i64 %18, %indvars.iv22.unr.ph
  %61 = lshr i64 %60, 1
  %62 = add nuw i64 %61, 1
  %min.iters.check = icmp ult i64 %62, 2
  br i1 %min.iters.check, label %.lr.ph6.us.preheader74, label %min.iters.checked

.lr.ph6.us.preheader74:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph6.us.preheader40
  %indvars.iv22.ph = phi i64 [ %indvars.iv22.unr.ph, %vector.memcheck ], [ %indvars.iv22.unr.ph, %min.iters.checked ], [ %indvars.iv22.unr.ph, %.lr.ph6.us.preheader40 ], [ %ind.end, %middle.block ]
  br label %.lr.ph6.us

min.iters.checked:                                ; preds = %.lr.ph6.us.preheader40
  %n.mod.vf = and i64 %62, 1
  %n.vec = sub i64 %62, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph6.us.preheader74, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %4, i64 %indvars.iv22.unr.ph
  %scevgep56 = bitcast double* %scevgep to i8*
  %63 = sub nsw i64 %19, %indvars.iv22.unr.ph
  %64 = and i64 %63, -2
  %65 = or i64 %indvars.iv22.unr.ph, %64
  %scevgep58 = getelementptr double, double* %scevgep57, i64 %65
  %scevgep5859 = bitcast double* %scevgep58 to i8*
  %scevgep61 = getelementptr [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv22.unr.ph
  %scevgep64 = getelementptr double, double* %scevgep63, i64 %65
  %bound0 = icmp ult double* %scevgep, %scevgep64
  %bound1 = icmp ult double* %scevgep61, %scevgep58
  %found.conflict = and i1 %bound0, %bound1
  %bc = inttoptr i64 %sunkaddr46 to i8*
  %bc66 = inttoptr i64 %sunkaddr46 to i8*
  %bound067 = icmp ult i8* %scevgep56, %bc66
  %bound168 = icmp ult i8* %bc, %scevgep5859
  %found.conflict69 = and i1 %bound067, %bound168
  %conflict.rdx = or i1 %found.conflict, %found.conflict69
  %66 = or i64 %indvars.iv22.unr.ph, 2
  %67 = shl nuw i64 %61, 1
  %68 = add i64 %66, %67
  %69 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %68, %69
  br i1 %conflict.rdx, label %.lr.ph6.us.preheader74, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %70 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv22.unr.ph, %70
  %71 = getelementptr inbounds double, double* %4, i64 %offset.idx
  %72 = bitcast double* %71 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %72, align 8, !alias.scope !4, !noalias !7
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec70 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %73 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv29, i64 %offset.idx
  %74 = bitcast double* %73 to <4 x double>*
  %wide.vec71 = load <4 x double>, <4 x double>* %74, align 8, !alias.scope !10
  %strided.vec72 = shufflevector <4 x double> %wide.vec71, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec73 = shufflevector <4 x double> %wide.vec71, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %75 = load double, double* %sunkaddr47, align 8, !alias.scope !11
  %76 = insertelement <2 x double> undef, double %75, i32 0
  %77 = shufflevector <2 x double> %76, <2 x double> undef, <2 x i32> zeroinitializer
  %78 = fmul <2 x double> %strided.vec72, %77
  %79 = fadd <2 x double> %strided.vec, %78
  %80 = add nuw nsw i64 %offset.idx, 1
  %81 = getelementptr inbounds double, double* %4, i64 %80
  %82 = load double, double* %sunkaddr47, align 8, !alias.scope !11
  %83 = insertelement <2 x double> undef, double %82, i32 0
  %84 = shufflevector <2 x double> %83, <2 x double> undef, <2 x i32> zeroinitializer
  %85 = fmul <2 x double> %strided.vec73, %84
  %86 = fadd <2 x double> %strided.vec70, %85
  %87 = getelementptr double, double* %81, i64 -1
  %88 = bitcast double* %87 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %79, <2 x double> %86, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %88, align 8, !alias.scope !4, !noalias !7
  %index.next = add i64 %index, 2
  %89 = icmp eq i64 %index.next, %n.vec
  br i1 %89, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.lr.ph6.us.preheader74

._crit_edge9.loopexit21:                          ; preds = %.lr.ph8
  %90 = bitcast double* %5 to i8*
  %91 = add i32 %0, -1
  %92 = zext i32 %91 to i64
  %93 = shl nuw nsw i64 %92, 3
  %94 = add nuw nsw i64 %93, 8
  call void @llvm.memset.p0i8.i64(i8* %90, i8 0, i64 %94, i32 8, i1 false)
  br label %._crit_edge9

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge9.loopexit21, %.preheader3
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double* nocapture readonly) #0 {
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

; <label>:13:                                     ; preds = %.lr.ph, %11
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
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!7 = !{!8, !9}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = !{!8}
!11 = !{!9}
!12 = distinct !{!12, !2, !3}
