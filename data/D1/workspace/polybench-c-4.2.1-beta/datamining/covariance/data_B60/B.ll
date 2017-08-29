; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
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
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
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
  %11 = add nsw i32 %xtraiter88, -1
  %12 = zext i32 %11 to i64
  br label %.lr.ph30.split.prol

.lr.ph30.split.prol:                              ; preds = %.lr.ph30.split.prol.preheader, %.lr.ph30.split.prol
  %indvars.iv84.prol = phi i64 [ %indvars.iv.next85.prol, %.lr.ph30.split.prol ], [ 0, %.lr.ph30.split.prol.preheader ]
  %prol.iter90 = phi i32 [ %prol.iter90.sub, %.lr.ph30.split.prol ], [ %xtraiter88, %.lr.ph30.split.prol.preheader ]
  %13 = getelementptr inbounds double, double* %5, i64 %indvars.iv84.prol
  store double %10, double* %13, align 8
  %indvars.iv.next85.prol = add nuw nsw i64 %indvars.iv84.prol, 1
  %prol.iter90.sub = add nsw i32 %prol.iter90, -1
  %prol.iter90.cmp = icmp eq i32 %prol.iter90.sub, 0
  br i1 %prol.iter90.cmp, label %.lr.ph30.split.prol.loopexit.loopexit, label %.lr.ph30.split.prol, !llvm.loop !1

.lr.ph30.split.prol.loopexit.loopexit:            ; preds = %.lr.ph30.split.prol
  %14 = add nuw nsw i64 %12, 1
  br label %.lr.ph30.split.prol.loopexit

.lr.ph30.split.prol.loopexit:                     ; preds = %.lr.ph30.split.prol.loopexit.loopexit, %.lr.ph30.split.preheader
  %indvars.iv84.unr = phi i64 [ 0, %.lr.ph30.split.preheader ], [ %14, %.lr.ph30.split.prol.loopexit.loopexit ]
  %15 = icmp ult i32 %9, 3
  br i1 %15, label %.preheader7, label %.lr.ph30.split.preheader93

.lr.ph30.split.preheader93:                       ; preds = %.lr.ph30.split.prol.loopexit
  %16 = fdiv double 0.000000e+00, %2
  %wide.trip.count86.3 = zext i32 %0 to i64
  %17 = add nsw i64 %wide.trip.count86.3, -4
  %18 = sub nsw i64 %17, %indvars.iv84.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 4
  br i1 %min.iters.check, label %.lr.ph30.split.preheader143, label %min.iters.checked

.lr.ph30.split.preheader143:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph30.split.preheader93
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
  br i1 %cmp.zero, label %.lr.ph30.split.preheader143, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %16, i32 0
  %interleaved.vec = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %25 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv84.unr, %25
  %26 = add i64 %indvars.iv84.unr, %25
  %27 = add nsw i64 %26, 3
  %28 = add i64 %offset.idx, 11
  %29 = getelementptr inbounds double, double* %5, i64 %27
  %30 = getelementptr inbounds double, double* %5, i64 %28
  %31 = getelementptr double, double* %29, i64 -3
  %32 = bitcast double* %31 to <8 x double>*
  %33 = getelementptr double, double* %30, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %32, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8
  %index.next = add i64 %index, 4
  %35 = icmp eq i64 %index.next, %n.vec
  br i1 %35, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader7, label %.lr.ph30.split.preheader143

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %36 = add i32 %1, -1
  %xtraiter77 = and i32 %1, 3
  %lcmp.mod78 = icmp eq i32 %xtraiter77, 0
  %37 = icmp ult i32 %36, 3
  %wide.trip.count82 = zext i32 %0 to i64
  %wide.trip.count73.3 = zext i32 %1 to i64
  %38 = add nsw i32 %xtraiter77, -1
  %39 = zext i32 %38 to i64
  %40 = add nuw nsw i64 %39, 1
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge27.us, %.lr.ph30.split.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next81, %._crit_edge27.us ]
  %41 = getelementptr inbounds double, double* %5, i64 %indvars.iv80
  store double 0.000000e+00, double* %41, align 8
  br i1 %lcmp.mod78, label %.prol.loopexit76, label %.prol.preheader75.preheader

.prol.preheader75.preheader:                      ; preds = %.lr.ph30.split.us
  br label %.prol.preheader75

.prol.preheader75:                                ; preds = %.prol.preheader75.preheader, %.prol.preheader75
  %42 = phi double [ %45, %.prol.preheader75 ], [ 0.000000e+00, %.prol.preheader75.preheader ]
  %indvars.iv71.prol = phi i64 [ %indvars.iv.next72.prol, %.prol.preheader75 ], [ 0, %.prol.preheader75.preheader ]
  %prol.iter79 = phi i32 [ %prol.iter79.sub, %.prol.preheader75 ], [ %xtraiter77, %.prol.preheader75.preheader ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71.prol, i64 %indvars.iv80
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %41, align 8
  %indvars.iv.next72.prol = add nuw nsw i64 %indvars.iv71.prol, 1
  %prol.iter79.sub = add nsw i32 %prol.iter79, -1
  %prol.iter79.cmp = icmp eq i32 %prol.iter79.sub, 0
  br i1 %prol.iter79.cmp, label %.prol.loopexit76.loopexit, label %.prol.preheader75, !llvm.loop !6

.prol.loopexit76.loopexit:                        ; preds = %.prol.preheader75
  br label %.prol.loopexit76

.prol.loopexit76:                                 ; preds = %.prol.loopexit76.loopexit, %.lr.ph30.split.us
  %46 = phi double [ 0.000000e+00, %.lr.ph30.split.us ], [ %45, %.prol.loopexit76.loopexit ]
  %indvars.iv71.unr = phi i64 [ 0, %.lr.ph30.split.us ], [ %40, %.prol.loopexit76.loopexit ]
  br i1 %37, label %._crit_edge27.us, label %.lr.ph30.split.us.new.preheader

.lr.ph30.split.us.new.preheader:                  ; preds = %.prol.loopexit76
  br label %.lr.ph30.split.us.new

.lr.ph30.split.us.new:                            ; preds = %.lr.ph30.split.us.new.preheader, %.lr.ph30.split.us.new
  %47 = phi double [ %59, %.lr.ph30.split.us.new ], [ %46, %.lr.ph30.split.us.new.preheader ]
  %indvars.iv71 = phi i64 [ %indvars.iv.next72.3, %.lr.ph30.split.us.new ], [ %indvars.iv71.unr, %.lr.ph30.split.us.new.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %indvars.iv80
  %49 = load double, double* %48, align 8
  %50 = fadd double %49, %47
  store double %50, double* %41, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next72, i64 %indvars.iv80
  %52 = load double, double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %41, align 8
  %indvars.iv.next72.1 = add nsw i64 %indvars.iv71, 2
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next72.1, i64 %indvars.iv80
  %55 = load double, double* %54, align 8
  %56 = fadd double %55, %53
  store double %56, double* %41, align 8
  %indvars.iv.next72.2 = add nsw i64 %indvars.iv71, 3
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next72.2, i64 %indvars.iv80
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %41, align 8
  %indvars.iv.next72.3 = add nsw i64 %indvars.iv71, 4
  %exitcond74.3 = icmp eq i64 %indvars.iv.next72.3, %wide.trip.count73.3
  br i1 %exitcond74.3, label %._crit_edge27.us.loopexit, label %.lr.ph30.split.us.new

._crit_edge27.us.loopexit:                        ; preds = %.lr.ph30.split.us.new
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.loopexit, %.prol.loopexit76
  %60 = phi double [ %46, %.prol.loopexit76 ], [ %59, %._crit_edge27.us.loopexit ]
  %61 = fdiv double %60, %2
  store double %61, double* %41, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83, label %.preheader7.loopexit, label %.lr.ph30.split.us

.preheader7.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader7

.preheader7.loopexit144:                          ; preds = %.lr.ph30.split
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit144, %.preheader7.loopexit, %middle.block, %.lr.ph30.split.prol.loopexit, %6
  %62 = icmp sgt i32 %1, 0
  br i1 %62, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  br i1 %7, label %.preheader6.us.preheader, label %._crit_edge13

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %63 = add i32 %0, -1
  %xtraiter64 = and i32 %0, 3
  %lcmp.mod65 = icmp eq i32 %xtraiter64, 0
  %64 = icmp ult i32 %63, 3
  %wide.trip.count68 = zext i32 %1 to i64
  %wide.trip.count60.3 = zext i32 %0 to i64
  %65 = add nsw i64 %wide.trip.count60.3, -4
  %66 = add nsw i64 %wide.trip.count60.3, -4
  %scevgep119 = getelementptr double, double* %5, i64 4
  %67 = add nsw i32 %xtraiter64, -1
  %68 = zext i32 %67 to i64
  %69 = add nuw nsw i64 %68, 1
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge22.us, %.preheader6.us.preheader
  %indvars.iv66 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next67, %._crit_edge22.us ]
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 4
  br i1 %lcmp.mod65, label %.prol.loopexit63, label %.prol.preheader62.preheader

.prol.preheader62.preheader:                      ; preds = %.preheader6.us
  br label %.prol.preheader62

.prol.preheader62:                                ; preds = %.prol.preheader62.preheader, %.prol.preheader62
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.prol.preheader62 ], [ 0, %.prol.preheader62.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader62 ], [ %xtraiter64, %.prol.preheader62.preheader ]
  %70 = getelementptr inbounds double, double* %5, i64 %indvars.iv58.prol
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58.prol
  %73 = load double, double* %72, align 8
  %74 = fsub double %73, %71
  store double %74, double* %72, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit63.loopexit, label %.prol.preheader62, !llvm.loop !7

.prol.loopexit63.loopexit:                        ; preds = %.prol.preheader62
  br label %.prol.loopexit63

.prol.loopexit63:                                 ; preds = %.prol.loopexit63.loopexit, %.preheader6.us
  %indvars.iv58.unr = phi i64 [ 0, %.preheader6.us ], [ %69, %.prol.loopexit63.loopexit ]
  br i1 %64, label %._crit_edge22.us, label %.preheader6.us.new.preheader

.preheader6.us.new.preheader:                     ; preds = %.prol.loopexit63
  %75 = sub nsw i64 %65, %indvars.iv58.unr
  %76 = lshr i64 %75, 2
  %77 = add nuw nsw i64 %76, 1
  %min.iters.check106 = icmp ult i64 %77, 2
  br i1 %min.iters.check106, label %.preheader6.us.new.preheader142, label %min.iters.checked107

min.iters.checked107:                             ; preds = %.preheader6.us.new.preheader
  %n.mod.vf108 = and i64 %77, 1
  %n.vec109 = sub nsw i64 %77, %n.mod.vf108
  %cmp.zero110 = icmp eq i64 %n.vec109, 0
  br i1 %cmp.zero110, label %.preheader6.us.new.preheader142, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked107
  %scevgep112 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58.unr
  %78 = sub nsw i64 %66, %indvars.iv58.unr
  %79 = and i64 %78, -4
  %80 = add nsw i64 %indvars.iv58.unr, %79
  %scevgep115 = getelementptr double, double* %scevgep114, i64 %80
  %scevgep117 = getelementptr double, double* %5, i64 %indvars.iv58.unr
  %scevgep120 = getelementptr double, double* %scevgep119, i64 %80
  %bound0 = icmp ult double* %scevgep112, %scevgep120
  %bound1 = icmp ult double* %scevgep117, %scevgep115
  %memcheck.conflict = and i1 %bound0, %bound1
  %81 = add nsw i64 %indvars.iv58.unr, 4
  %82 = shl nuw i64 %76, 2
  %83 = add i64 %81, %82
  %84 = shl nuw nsw i64 %n.mod.vf108, 2
  %ind.end126 = sub i64 %83, %84
  br i1 %memcheck.conflict, label %.preheader6.us.new.preheader142, label %vector.body103.preheader

vector.body103.preheader:                         ; preds = %vector.memcheck
  br label %vector.body103

vector.body103:                                   ; preds = %vector.body103.preheader, %vector.body103
  %index123 = phi i64 [ %index.next124, %vector.body103 ], [ 0, %vector.body103.preheader ]
  %85 = shl i64 %index123, 2
  %86 = add i64 %indvars.iv58.unr, %85
  %87 = getelementptr inbounds double, double* %5, i64 %86
  %88 = bitcast double* %87 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %88, align 8, !alias.scope !8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %86
  %90 = bitcast double* %89 to <8 x double>*
  %wide.vec135 = load <8 x double>, <8 x double>* %90, align 8, !alias.scope !11, !noalias !8
  %91 = fsub <8 x double> %wide.vec135, %wide.vec
  %92 = shufflevector <8 x double> %91, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %93 = fsub <8 x double> %wide.vec135, %wide.vec
  %94 = shufflevector <8 x double> %93, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %95 = fsub <8 x double> %wide.vec135, %wide.vec
  %96 = shufflevector <8 x double> %95, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %97 = add nsw i64 %86, 3
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %97
  %99 = fsub <8 x double> %wide.vec135, %wide.vec
  %100 = shufflevector <8 x double> %99, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %101 = getelementptr double, double* %98, i64 -3
  %102 = bitcast double* %101 to <8 x double>*
  %103 = shufflevector <2 x double> %92, <2 x double> %94, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %104 = shufflevector <2 x double> %96, <2 x double> %100, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec140 = shufflevector <4 x double> %103, <4 x double> %104, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec140, <8 x double>* %102, align 8, !alias.scope !11, !noalias !8
  %index.next124 = add i64 %index123, 2
  %105 = icmp eq i64 %index.next124, %n.vec109
  br i1 %105, label %middle.block104, label %vector.body103, !llvm.loop !13

middle.block104:                                  ; preds = %vector.body103
  %cmp.n127 = icmp eq i64 %n.mod.vf108, 0
  br i1 %cmp.n127, label %._crit_edge22.us, label %.preheader6.us.new.preheader142

.preheader6.us.new.preheader142:                  ; preds = %middle.block104, %vector.memcheck, %min.iters.checked107, %.preheader6.us.new.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr, %vector.memcheck ], [ %indvars.iv58.unr, %min.iters.checked107 ], [ %indvars.iv58.unr, %.preheader6.us.new.preheader ], [ %ind.end126, %middle.block104 ]
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us.new.preheader142, %.preheader6.us.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %.preheader6.us.new ], [ %indvars.iv58.ph, %.preheader6.us.new.preheader142 ]
  %106 = getelementptr inbounds double, double* %5, i64 %indvars.iv58
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58
  %109 = load double, double* %108, align 8
  %110 = fsub double %109, %107
  store double %110, double* %108, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %111 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59
  %114 = load double, double* %113, align 8
  %115 = fsub double %114, %112
  store double %115, double* %113, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %116 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.1
  %117 = load double, double* %116, align 8
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59.1
  %119 = load double, double* %118, align 8
  %120 = fsub double %119, %117
  store double %120, double* %118, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %121 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.2
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59.2
  %124 = load double, double* %123, align 8
  %125 = fsub double %124, %122
  store double %125, double* %123, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next59.3, %wide.trip.count60.3
  br i1 %exitcond61.3, label %._crit_edge22.us.loopexit, label %.preheader6.us.new, !llvm.loop !14

._crit_edge22.us.loopexit:                        ; preds = %.preheader6.us.new
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %middle.block104, %.prol.loopexit63
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %.preheader5.loopexit, label %.preheader6.us

.lr.ph30.split:                                   ; preds = %.lr.ph30.split.preheader143, %.lr.ph30.split
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.3, %.lr.ph30.split ], [ %indvars.iv84.ph, %.lr.ph30.split.preheader143 ]
  %126 = getelementptr inbounds double, double* %5, i64 %indvars.iv84
  store double %16, double* %126, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %127 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85
  store double %16, double* %127, align 8
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  %128 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.1
  store double %16, double* %128, align 8
  %indvars.iv.next85.2 = add nsw i64 %indvars.iv84, 3
  %129 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.2
  store double %16, double* %129, align 8
  %indvars.iv.next85.3 = add nsw i64 %indvars.iv84, 4
  %exitcond87.3 = icmp eq i64 %indvars.iv.next85.3, %wide.trip.count86.3
  br i1 %exitcond87.3, label %.preheader7.loopexit144, label %.lr.ph30.split, !llvm.loop !15

.preheader5.loopexit:                             ; preds = %._crit_edge22.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader7
  br i1 %7, label %.preheader.lr.ph, label %._crit_edge13

.preheader.lr.ph:                                 ; preds = %.preheader5
  %130 = fadd double %2, -1.000000e+00
  br i1 %62, label %.lr.ph10.us.preheader, label %.preheader.preheader

.lr.ph10.us.preheader:                            ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %131 = icmp eq i32 %1, 1
  %wide.trip.count38 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph10.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %132 = zext i32 %0 to i64
  %133 = add i32 %0, -1
  %134 = zext i32 %133 to i64
  %135 = fdiv double 0.000000e+00, %130
  %136 = add nsw i64 %132, -2
  br label %.lr.ph10

._crit_edge11.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count38
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
  %143 = fadd double %142, 0.000000e+00
  store double %143, double* %138, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %144 = phi double [ %143, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %131, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %145 = phi double [ %144, %.prol.loopexit ], [ %160, %._crit_edge.us.us.loopexit ]
  %146 = fdiv double %145, %130
  store double %146, double* %138, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv40
  store double %146, double* %147, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond, label %._crit_edge11.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %148 = phi double [ %160, %.lr.ph.us.us.new ], [ %144, %.lr.ph.us.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv40
  %150 = load double, double* %149, align 8
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv36
  %152 = load double, double* %151, align 8
  %153 = fmul double %150, %152
  %154 = fadd double %148, %153
  store double %154, double* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv40
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv36
  %158 = load double, double* %157, align 8
  %159 = fmul double %156, %158
  %160 = fadd double %154, %159
  store double %160, double* %138, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph10:                                         ; preds = %.preheader.preheader, %._crit_edge11
  %indvars.iv54 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next55, %._crit_edge11 ]
  %161 = sub i64 %134, %indvars.iv54
  %162 = trunc i64 %161 to i32
  %163 = sub i64 %132, %indvars.iv54
  %xtraiter5291 = and i64 %163, 1
  %lcmp.mod53 = icmp eq i64 %xtraiter5291, 0
  br i1 %lcmp.mod53, label %.prol.loopexit51, label %.prol.preheader50

.prol.preheader50:                                ; preds = %.lr.ph10
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv54
  store double %135, double* %164, align 8
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv54, 1
  br label %.prol.loopexit51

.prol.loopexit51:                                 ; preds = %.prol.preheader50, %.lr.ph10
  %indvars.iv46.unr.ph = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader50 ], [ %indvars.iv54, %.lr.ph10 ]
  %165 = icmp eq i32 %162, 0
  br i1 %165, label %._crit_edge11, label %.lr.ph10.new.preheader

.lr.ph10.new.preheader:                           ; preds = %.prol.loopexit51
  %166 = sub i64 %136, %indvars.iv46.unr.ph
  %167 = lshr i64 %166, 1
  %168 = and i64 %167, 1
  %lcmp.mod148 = icmp eq i64 %168, 0
  br i1 %lcmp.mod148, label %.lr.ph10.new.prol.preheader, label %.lr.ph10.new.prol.loopexit.unr-lcssa

.lr.ph10.new.prol.preheader:                      ; preds = %.lr.ph10.new.preheader
  br label %.lr.ph10.new.prol

.lr.ph10.new.prol:                                ; preds = %.lr.ph10.new.prol.preheader
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv46.unr.ph
  store double %135, double* %169, align 8
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46.unr.ph, i64 %indvars.iv54
  store double %135, double* %170, align 8
  %indvars.iv.next47.prol149 = add nuw nsw i64 %indvars.iv46.unr.ph, 1
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.prol149
  store double %135, double* %171, align 8
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.prol149, i64 %indvars.iv54
  store double %135, double* %172, align 8
  %indvars.iv.next47.1.prol = add nsw i64 %indvars.iv46.unr.ph, 2
  br label %.lr.ph10.new.prol.loopexit.unr-lcssa

.lr.ph10.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph10.new.preheader, %.lr.ph10.new.prol
  %indvars.iv46.unr.ph150 = phi i64 [ %indvars.iv.next47.1.prol, %.lr.ph10.new.prol ], [ %indvars.iv46.unr.ph, %.lr.ph10.new.preheader ]
  br label %.lr.ph10.new.prol.loopexit

.lr.ph10.new.prol.loopexit:                       ; preds = %.lr.ph10.new.prol.loopexit.unr-lcssa
  %173 = icmp eq i64 %167, 0
  br i1 %173, label %._crit_edge11.loopexit, label %.lr.ph10.new.preheader.new

.lr.ph10.new.preheader.new:                       ; preds = %.lr.ph10.new.prol.loopexit
  br label %.lr.ph10.new

.lr.ph10.new:                                     ; preds = %.lr.ph10.new, %.lr.ph10.new.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr.ph150, %.lr.ph10.new.preheader.new ], [ %indvars.iv.next47.1.1, %.lr.ph10.new ]
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv46
  store double %135, double* %174, align 8
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv54
  store double %135, double* %175, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47
  store double %135, double* %176, align 8
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47, i64 %indvars.iv54
  store double %135, double* %177, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.1
  store double %135, double* %178, align 8
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.1, i64 %indvars.iv54
  store double %135, double* %179, align 8
  %indvars.iv.next47.1151 = add nsw i64 %indvars.iv46, 3
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.1151
  store double %135, double* %180, align 8
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.1151, i64 %indvars.iv54
  store double %135, double* %181, align 8
  %indvars.iv.next47.1.1 = add nsw i64 %indvars.iv46, 4
  %exitcond49.1.1 = icmp eq i64 %indvars.iv.next47.1.1, %132
  br i1 %exitcond49.1.1, label %._crit_edge11.loopexit.unr-lcssa, label %.lr.ph10.new

._crit_edge11.loopexit.unr-lcssa:                 ; preds = %.lr.ph10.new
  br label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %.lr.ph10.new.prol.loopexit, %._crit_edge11.loopexit.unr-lcssa
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.prol.loopexit51
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %132
  br i1 %exitcond57, label %._crit_edge13.loopexit141, label %.lr.ph10

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us-lcssa.us.us
  br label %._crit_edge13

._crit_edge13.loopexit141:                        ; preds = %._crit_edge11
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit141, %._crit_edge13.loopexit, %.preheader6.lr.ph, %.preheader5
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
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count
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
