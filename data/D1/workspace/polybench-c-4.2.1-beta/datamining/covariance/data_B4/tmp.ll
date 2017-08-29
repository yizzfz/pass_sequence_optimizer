; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
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
  tail call void @print_array(i32 1200, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) #2 {
  %5 = sitofp i32 %1 to double
  store double %5, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %4
  %indvars.iv4 = phi i64 [ 0, %4 ], [ %indvars.iv.next5, %19 ]
  %6 = trunc i64 %indvars.iv4 to i32
  %7 = sitofp i32 %6 to double
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %8 ]
  %9 = trunc i64 %indvars.iv to i32
  %10 = sitofp i32 %9 to double
  %11 = fmul double %7, %10
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv4, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %7, %15
  %17 = fdiv double %16, 1.200000e+03
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %8

; <label>:19:                                     ; preds = %8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph30, label %.preheader7

.lr.ph30:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph30.split.us.preheader, label %.lr.ph30.split.preheader

.lr.ph30.split.preheader:                         ; preds = %.lr.ph30
  %9 = add i32 %0, -1
  %xtraiter88 = and i32 %0, 3
  %lcmp.mod89 = icmp eq i32 %xtraiter88, 0
  br i1 %lcmp.mod89, label %.lr.ph30.split.prol.loopexit, label %.lr.ph30.split.prol.preheader

.lr.ph30.split.prol.preheader:                    ; preds = %.lr.ph30.split.preheader
  %10 = fdiv double 0.000000e+00, %2
  br label %.lr.ph30.split.prol

.lr.ph30.split.prol:                              ; preds = %.lr.ph30.split.prol.preheader, %.lr.ph30.split.prol
  %indvars.iv84.prol = phi i64 [ %indvars.iv.next85.prol, %.lr.ph30.split.prol ], [ 0, %.lr.ph30.split.prol.preheader ]
  %prol.iter90 = phi i32 [ %prol.iter90.sub, %.lr.ph30.split.prol ], [ %xtraiter88, %.lr.ph30.split.prol.preheader ]
  %11 = getelementptr inbounds double, double* %5, i64 %indvars.iv84.prol
  store double %10, double* %11, align 8
  %indvars.iv.next85.prol = add nuw nsw i64 %indvars.iv84.prol, 1
  %prol.iter90.sub = add i32 %prol.iter90, -1
  %prol.iter90.cmp = icmp eq i32 %prol.iter90.sub, 0
  br i1 %prol.iter90.cmp, label %.lr.ph30.split.prol.loopexit.loopexit, label %.lr.ph30.split.prol, !llvm.loop !1

.lr.ph30.split.prol.loopexit.loopexit:            ; preds = %.lr.ph30.split.prol
  br label %.lr.ph30.split.prol.loopexit

.lr.ph30.split.prol.loopexit:                     ; preds = %.lr.ph30.split.prol.loopexit.loopexit, %.lr.ph30.split.preheader
  %indvars.iv84.unr = phi i64 [ 0, %.lr.ph30.split.preheader ], [ %indvars.iv.next85.prol, %.lr.ph30.split.prol.loopexit.loopexit ]
  %12 = icmp ult i32 %9, 3
  br i1 %12, label %.preheader7, label %.lr.ph30.split.preheader93

.lr.ph30.split.preheader93:                       ; preds = %.lr.ph30.split.prol.loopexit
  %13 = fdiv double 0.000000e+00, %2
  %14 = fdiv double 0.000000e+00, %2
  %15 = fdiv double 0.000000e+00, %2
  %16 = fdiv double 0.000000e+00, %2
  %wide.trip.count86.3 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count86.3, -4
  %18 = sub i64 %17, %indvars.iv84.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 4
  br i1 %min.iters.check, label %.lr.ph30.split.preheader147, label %min.iters.checked

.lr.ph30.split.preheader147:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph30.split.preheader93
  %indvars.iv84.ph = phi i64 [ %indvars.iv84.unr, %min.iters.checked ], [ %indvars.iv84.unr, %.lr.ph30.split.preheader93 ], [ %ind.end, %middle.block ]
  br label %.lr.ph30.split

min.iters.checked:                                ; preds = %.lr.ph30.split.preheader93
  %n.mod.vf = and i64 %20, 3
  %n.vec = sub nsw i64 %20, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = shl nuw i64 %19, 2
  %22 = add i64 %indvars.iv84.unr, %21
  %23 = add i64 %22, 4
  %24 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %.lr.ph30.split.preheader147, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert98 = insertelement <2 x double> undef, double %13, i32 0
  %broadcast.splat99 = shufflevector <2 x double> %broadcast.splatinsert98, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %14, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert102 = insertelement <2 x double> undef, double %15, i32 0
  %broadcast.splat103 = shufflevector <2 x double> %broadcast.splatinsert102, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert104 = insertelement <2 x double> undef, double %16, i32 0
  %broadcast.splat105 = shufflevector <2 x double> %broadcast.splatinsert104, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = shufflevector <2 x double> %broadcast.splat99, <2 x double> %broadcast.splat101, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %26 = shufflevector <2 x double> %broadcast.splat103, <2 x double> %broadcast.splat105, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %25, <4 x double> %26, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %27 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv84.unr, %27
  %28 = add i64 %indvars.iv84.unr, %27
  %29 = add nsw i64 %28, 3
  %30 = add i64 %offset.idx, 11
  %31 = getelementptr inbounds double, double* %5, i64 %29
  %32 = getelementptr inbounds double, double* %5, i64 %30
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = getelementptr double, double* %32, i64 -3
  %36 = bitcast double* %35 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %36, align 8
  %index.next = add i64 %index, 4
  %37 = icmp eq i64 %index.next, %n.vec
  br i1 %37, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader7, label %.lr.ph30.split.preheader147

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %38 = add i32 %1, -1
  %xtraiter77 = and i32 %1, 3
  %lcmp.mod78 = icmp eq i32 %xtraiter77, 0
  %39 = icmp ult i32 %38, 3
  %wide.trip.count82 = zext i32 %0 to i64
  %wide.trip.count73.3 = zext i32 %1 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge27.us, %.lr.ph30.split.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next81, %._crit_edge27.us ]
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv80
  store double 0.000000e+00, double* %40, align 8
  br i1 %lcmp.mod78, label %.prol.loopexit76, label %.prol.preheader75.preheader

.prol.preheader75.preheader:                      ; preds = %.lr.ph30.split.us
  br label %.prol.preheader75

.prol.preheader75:                                ; preds = %.prol.preheader75.preheader, %.prol.preheader75
  %indvars.iv71.prol = phi i64 [ %indvars.iv.next72.prol, %.prol.preheader75 ], [ 0, %.prol.preheader75.preheader ]
  %prol.iter79 = phi i32 [ %prol.iter79.sub, %.prol.preheader75 ], [ %xtraiter77, %.prol.preheader75.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71.prol, i64 %indvars.iv80
  %42 = load double, double* %41, align 8
  %43 = load double, double* %40, align 8
  %44 = fadd double %42, %43
  store double %44, double* %40, align 8
  %indvars.iv.next72.prol = add nuw nsw i64 %indvars.iv71.prol, 1
  %prol.iter79.sub = add i32 %prol.iter79, -1
  %prol.iter79.cmp = icmp eq i32 %prol.iter79.sub, 0
  br i1 %prol.iter79.cmp, label %.prol.loopexit76.loopexit, label %.prol.preheader75, !llvm.loop !6

.prol.loopexit76.loopexit:                        ; preds = %.prol.preheader75
  br label %.prol.loopexit76

.prol.loopexit76:                                 ; preds = %.prol.loopexit76.loopexit, %.lr.ph30.split.us
  %indvars.iv71.unr = phi i64 [ 0, %.lr.ph30.split.us ], [ %indvars.iv.next72.prol, %.prol.loopexit76.loopexit ]
  br i1 %39, label %._crit_edge27.us, label %.lr.ph30.split.us.new.preheader

.lr.ph30.split.us.new.preheader:                  ; preds = %.prol.loopexit76
  br label %.lr.ph30.split.us.new

.lr.ph30.split.us.new:                            ; preds = %.lr.ph30.split.us.new.preheader, %.lr.ph30.split.us.new
  %indvars.iv71 = phi i64 [ %indvars.iv.next72.3, %.lr.ph30.split.us.new ], [ %indvars.iv71.unr, %.lr.ph30.split.us.new.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %indvars.iv80
  %46 = load double, double* %45, align 8
  %47 = load double, double* %40, align 8
  %48 = fadd double %46, %47
  store double %48, double* %40, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next72, i64 %indvars.iv80
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  store double %51, double* %40, align 8
  %indvars.iv.next72.1 = add nsw i64 %indvars.iv71, 2
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next72.1, i64 %indvars.iv80
  %53 = load double, double* %52, align 8
  %54 = fadd double %53, %51
  store double %54, double* %40, align 8
  %indvars.iv.next72.2 = add nsw i64 %indvars.iv71, 3
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next72.2, i64 %indvars.iv80
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %40, align 8
  %indvars.iv.next72.3 = add nsw i64 %indvars.iv71, 4
  %exitcond74.3 = icmp eq i64 %indvars.iv.next72.3, %wide.trip.count73.3
  br i1 %exitcond74.3, label %._crit_edge27.us.loopexit, label %.lr.ph30.split.us.new

._crit_edge27.us.loopexit:                        ; preds = %.lr.ph30.split.us.new
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.loopexit, %.prol.loopexit76
  %58 = load double, double* %40, align 8
  %59 = fdiv double %58, %2
  store double %59, double* %40, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83, label %.preheader7.loopexit, label %.lr.ph30.split.us

.preheader7.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader7

.preheader7.loopexit148:                          ; preds = %.lr.ph30.split
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit148, %.preheader7.loopexit, %middle.block, %.lr.ph30.split.prol.loopexit, %6
  %60 = icmp sgt i32 %1, 0
  br i1 %60, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %61 = icmp sgt i32 %0, 0
  br i1 %61, label %.preheader6.us.preheader, label %._crit_edge13

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %62 = add i32 %0, -1
  %xtraiter64 = and i32 %0, 3
  %lcmp.mod65 = icmp eq i32 %xtraiter64, 0
  %63 = icmp ult i32 %62, 3
  %wide.trip.count68 = zext i32 %1 to i64
  %wide.trip.count60.3 = zext i32 %0 to i64
  %64 = add nsw i64 %wide.trip.count60.3, -4
  %65 = add nsw i64 %wide.trip.count60.3, -4
  %scevgep123 = getelementptr double, double* %5, i64 4
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge22.us, %.preheader6.us.preheader
  %indvars.iv66 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next67, %._crit_edge22.us ]
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 4
  br i1 %lcmp.mod65, label %.prol.loopexit63, label %.prol.preheader62.preheader

.prol.preheader62.preheader:                      ; preds = %.preheader6.us
  br label %.prol.preheader62

.prol.preheader62:                                ; preds = %.prol.preheader62.preheader, %.prol.preheader62
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.prol.preheader62 ], [ 0, %.prol.preheader62.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader62 ], [ %xtraiter64, %.prol.preheader62.preheader ]
  %66 = getelementptr inbounds double, double* %5, i64 %indvars.iv58.prol
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58.prol
  %69 = load double, double* %68, align 8
  %70 = fsub double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit63.loopexit, label %.prol.preheader62, !llvm.loop !7

.prol.loopexit63.loopexit:                        ; preds = %.prol.preheader62
  br label %.prol.loopexit63

.prol.loopexit63:                                 ; preds = %.prol.loopexit63.loopexit, %.preheader6.us
  %indvars.iv58.unr = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next59.prol, %.prol.loopexit63.loopexit ]
  br i1 %63, label %._crit_edge22.us, label %.preheader6.us.new.preheader

.preheader6.us.new.preheader:                     ; preds = %.prol.loopexit63
  %71 = sub i64 %64, %indvars.iv58.unr
  %72 = lshr i64 %71, 2
  %73 = add nuw nsw i64 %72, 1
  %min.iters.check110 = icmp ult i64 %73, 2
  br i1 %min.iters.check110, label %.preheader6.us.new.preheader146, label %min.iters.checked111

min.iters.checked111:                             ; preds = %.preheader6.us.new.preheader
  %n.mod.vf112 = and i64 %73, 1
  %n.vec113 = sub nsw i64 %73, %n.mod.vf112
  %cmp.zero114 = icmp eq i64 %n.vec113, 0
  br i1 %cmp.zero114, label %.preheader6.us.new.preheader146, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked111
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58.unr
  %74 = sub i64 %65, %indvars.iv58.unr
  %75 = and i64 %74, -4
  %76 = add i64 %indvars.iv58.unr, %75
  %scevgep119 = getelementptr double, double* %scevgep118, i64 %76
  %scevgep121 = getelementptr double, double* %5, i64 %indvars.iv58.unr
  %scevgep124 = getelementptr double, double* %scevgep123, i64 %76
  %bound0 = icmp ult double* %scevgep116, %scevgep124
  %bound1 = icmp ult double* %scevgep121, %scevgep119
  %memcheck.conflict = and i1 %bound0, %bound1
  %77 = add i64 %indvars.iv58.unr, 4
  %78 = shl nuw i64 %72, 2
  %79 = add i64 %77, %78
  %80 = shl nuw nsw i64 %n.mod.vf112, 2
  %ind.end130 = sub i64 %79, %80
  br i1 %memcheck.conflict, label %.preheader6.us.new.preheader146, label %vector.body107.preheader

vector.body107.preheader:                         ; preds = %vector.memcheck
  br label %vector.body107

vector.body107:                                   ; preds = %vector.body107.preheader, %vector.body107
  %index127 = phi i64 [ %index.next128, %vector.body107 ], [ 0, %vector.body107.preheader ]
  %81 = shl i64 %index127, 2
  %82 = add i64 %indvars.iv58.unr, %81
  %83 = getelementptr inbounds double, double* %5, i64 %82
  %84 = bitcast double* %83 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %84, align 8, !alias.scope !8
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %82
  %86 = bitcast double* %85 to <8 x double>*
  %wide.vec139 = load <8 x double>, <8 x double>* %86, align 8, !alias.scope !11, !noalias !8
  %87 = fsub <8 x double> %wide.vec139, %wide.vec
  %88 = shufflevector <8 x double> %87, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %89 = fsub <8 x double> %wide.vec139, %wide.vec
  %90 = shufflevector <8 x double> %89, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %91 = fsub <8 x double> %wide.vec139, %wide.vec
  %92 = shufflevector <8 x double> %91, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %93 = add nsw i64 %82, 3
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %93
  %95 = fsub <8 x double> %wide.vec139, %wide.vec
  %96 = shufflevector <8 x double> %95, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %97 = getelementptr double, double* %94, i64 -3
  %98 = bitcast double* %97 to <8 x double>*
  %99 = shufflevector <2 x double> %88, <2 x double> %90, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %100 = shufflevector <2 x double> %92, <2 x double> %96, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec144 = shufflevector <4 x double> %99, <4 x double> %100, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec144, <8 x double>* %98, align 8, !alias.scope !11, !noalias !8
  %index.next128 = add i64 %index127, 2
  %101 = icmp eq i64 %index.next128, %n.vec113
  br i1 %101, label %middle.block108, label %vector.body107, !llvm.loop !13

middle.block108:                                  ; preds = %vector.body107
  %cmp.n131 = icmp eq i64 %n.mod.vf112, 0
  br i1 %cmp.n131, label %._crit_edge22.us, label %.preheader6.us.new.preheader146

.preheader6.us.new.preheader146:                  ; preds = %middle.block108, %vector.memcheck, %min.iters.checked111, %.preheader6.us.new.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr, %vector.memcheck ], [ %indvars.iv58.unr, %min.iters.checked111 ], [ %indvars.iv58.unr, %.preheader6.us.new.preheader ], [ %ind.end130, %middle.block108 ]
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us.new.preheader146, %.preheader6.us.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %.preheader6.us.new ], [ %indvars.iv58.ph, %.preheader6.us.new.preheader146 ]
  %102 = getelementptr inbounds double, double* %5, i64 %indvars.iv58
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58
  %105 = load double, double* %104, align 8
  %106 = fsub double %105, %103
  store double %106, double* %104, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %107 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59
  %110 = load double, double* %109, align 8
  %111 = fsub double %110, %108
  store double %111, double* %109, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %112 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.1
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59.1
  %115 = load double, double* %114, align 8
  %116 = fsub double %115, %113
  store double %116, double* %114, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %117 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.2
  %118 = load double, double* %117, align 8
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59.2
  %120 = load double, double* %119, align 8
  %121 = fsub double %120, %118
  store double %121, double* %119, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next59.3, %wide.trip.count60.3
  br i1 %exitcond61.3, label %._crit_edge22.us.loopexit, label %.preheader6.us.new, !llvm.loop !14

._crit_edge22.us.loopexit:                        ; preds = %.preheader6.us.new
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %middle.block108, %.prol.loopexit63
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %.preheader5.loopexit, label %.preheader6.us

.lr.ph30.split:                                   ; preds = %.lr.ph30.split.preheader147, %.lr.ph30.split
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.3, %.lr.ph30.split ], [ %indvars.iv84.ph, %.lr.ph30.split.preheader147 ]
  %122 = getelementptr inbounds double, double* %5, i64 %indvars.iv84
  store double %13, double* %122, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %123 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85
  store double %14, double* %123, align 8
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  %124 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.1
  store double %15, double* %124, align 8
  %indvars.iv.next85.2 = add nsw i64 %indvars.iv84, 3
  %125 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.2
  store double %16, double* %125, align 8
  %indvars.iv.next85.3 = add nsw i64 %indvars.iv84, 4
  %exitcond87.3 = icmp eq i64 %indvars.iv.next85.3, %wide.trip.count86.3
  br i1 %exitcond87.3, label %.preheader7.loopexit148, label %.lr.ph30.split, !llvm.loop !15

.preheader5.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader7
  %126 = icmp sgt i32 %0, 0
  br i1 %126, label %.preheader.lr.ph, label %._crit_edge13

.preheader.lr.ph:                                 ; preds = %.preheader5
  %127 = icmp sgt i32 %1, 0
  %128 = fadd double %2, -1.000000e+00
  br i1 %127, label %.lr.ph10.us.preheader, label %.preheader.preheader

.lr.ph10.us.preheader:                            ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %129 = icmp eq i32 %1, 1
  %wide.trip.count38 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  br label %.lr.ph10.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %130 = zext i32 %0 to i64
  %131 = add i32 %0, -1
  %132 = zext i32 %131 to i64
  %wide.trip.count56 = zext i32 %0 to i64
  %133 = fdiv double 0.000000e+00, %128
  %134 = fdiv double 0.000000e+00, %128
  %wide.trip.count48.1 = zext i32 %0 to i64
  %135 = fdiv double 0.000000e+00, %128
  %136 = add nsw i64 %wide.trip.count56, -2
  br label %.lr.ph10

._crit_edge11.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge13.loopexit, label %.lr.ph10.us

.lr.ph10.us:                                      ; preds = %.lr.ph10.us.preheader, %._crit_edge11.us-lcssa.us.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge11.us-lcssa.us.us ], [ 0, %.lr.ph10.us.preheader ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv40
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph10.us
  %indvars.iv36 = phi i64 [ %indvars.iv40, %.lr.ph10.us ], [ %indvars.iv.next37, %._crit_edge.us.us ]
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv36
  store double 0.000000e+00, double* %138, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %139 = load double, double* %137, align 8
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv36
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = load double, double* %138, align 8
  %144 = fadd double %143, %142
  store double %144, double* %138, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %129, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %145 = load double, double* %138, align 8
  %146 = fdiv double %145, %128
  store double %146, double* %138, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv40
  store double %146, double* %147, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond, label %._crit_edge11.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv40
  %149 = load double, double* %148, align 8
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv36
  %151 = load double, double* %150, align 8
  %152 = fmul double %149, %151
  %153 = load double, double* %138, align 8
  %154 = fadd double %153, %152
  store double %154, double* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv40
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv36
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = load double, double* %138, align 8
  %161 = fadd double %160, %159
  store double %161, double* %138, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph10:                                         ; preds = %.preheader.preheader, %._crit_edge11
  %indvars.iv54 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next55, %._crit_edge11 ]
  %162 = sub i64 %132, %indvars.iv54
  %163 = trunc i64 %162 to i32
  %164 = sub i64 %130, %indvars.iv54
  %xtraiter5291 = and i64 %164, 1
  %lcmp.mod53 = icmp eq i64 %xtraiter5291, 0
  br i1 %lcmp.mod53, label %.prol.loopexit51, label %.prol.preheader50

.prol.preheader50:                                ; preds = %.lr.ph10
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv54
  store double %135, double* %165, align 8
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv54, 1
  br label %.prol.loopexit51

.prol.loopexit51:                                 ; preds = %.prol.preheader50, %.lr.ph10
  %indvars.iv46.unr.ph = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader50 ], [ %indvars.iv54, %.lr.ph10 ]
  %166 = icmp eq i32 %163, 0
  br i1 %166, label %._crit_edge11, label %.lr.ph10.new.preheader

.lr.ph10.new.preheader:                           ; preds = %.prol.loopexit51
  %167 = sub i64 %136, %indvars.iv46.unr.ph
  %168 = lshr i64 %167, 1
  %169 = and i64 %168, 1
  %lcmp.mod150 = icmp eq i64 %169, 0
  br i1 %lcmp.mod150, label %.lr.ph10.new.prol.preheader, label %.lr.ph10.new.prol.loopexit.unr-lcssa

.lr.ph10.new.prol.preheader:                      ; preds = %.lr.ph10.new.preheader
  br label %.lr.ph10.new.prol

.lr.ph10.new.prol:                                ; preds = %.lr.ph10.new.prol.preheader
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv46.unr.ph
  store double %133, double* %170, align 8
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46.unr.ph, i64 %indvars.iv54
  store double %133, double* %171, align 8
  %indvars.iv.next47.prol151 = add nuw nsw i64 %indvars.iv46.unr.ph, 1
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.prol151
  store double %134, double* %172, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.prol151, i64 %indvars.iv54
  store double %134, double* %173, align 8
  %indvars.iv.next47.1.prol = add nsw i64 %indvars.iv46.unr.ph, 2
  br label %.lr.ph10.new.prol.loopexit.unr-lcssa

.lr.ph10.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph10.new.preheader, %.lr.ph10.new.prol
  %indvars.iv46.unr.ph152 = phi i64 [ %indvars.iv.next47.1.prol, %.lr.ph10.new.prol ], [ %indvars.iv46.unr.ph, %.lr.ph10.new.preheader ]
  br label %.lr.ph10.new.prol.loopexit

.lr.ph10.new.prol.loopexit:                       ; preds = %.lr.ph10.new.prol.loopexit.unr-lcssa
  %174 = icmp eq i64 %168, 0
  br i1 %174, label %._crit_edge11.loopexit, label %.lr.ph10.new.preheader.new

.lr.ph10.new.preheader.new:                       ; preds = %.lr.ph10.new.prol.loopexit
  br label %.lr.ph10.new

.lr.ph10.new:                                     ; preds = %.lr.ph10.new, %.lr.ph10.new.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr.ph152, %.lr.ph10.new.preheader.new ], [ %indvars.iv.next47.1.1, %.lr.ph10.new ]
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv46
  store double %133, double* %175, align 8
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv54
  store double %133, double* %176, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47
  store double %134, double* %177, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47, i64 %indvars.iv54
  store double %134, double* %178, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.1
  store double %133, double* %179, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.1, i64 %indvars.iv54
  store double %133, double* %180, align 8
  %indvars.iv.next47.1153 = add nsw i64 %indvars.iv46, 3
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.1153
  store double %134, double* %181, align 8
  %182 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.1153, i64 %indvars.iv54
  store double %134, double* %182, align 8
  %indvars.iv.next47.1.1 = add nsw i64 %indvars.iv46, 4
  %exitcond49.1.1 = icmp eq i64 %indvars.iv.next47.1.1, %wide.trip.count48.1
  br i1 %exitcond49.1.1, label %._crit_edge11.loopexit.unr-lcssa, label %.lr.ph10.new

._crit_edge11.loopexit.unr-lcssa:                 ; preds = %.lr.ph10.new
  br label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %.lr.ph10.new.prol.loopexit, %._crit_edge11.loopexit.unr-lcssa
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.prol.loopexit51
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %._crit_edge13.loopexit145, label %.lr.ph10

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us-lcssa.us.us
  br label %._crit_edge13

._crit_edge13.loopexit145:                        ; preds = %._crit_edge11
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit145, %._crit_edge13.loopexit, %.preheader6.lr.ph, %.preheader5
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1200 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
!15 = distinct !{!15, !16, !4, !5}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
