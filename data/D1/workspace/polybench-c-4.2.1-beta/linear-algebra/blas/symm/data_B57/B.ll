; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader42.lr.ph, label %._crit_edge49

.preheader42.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader42.us.preheader, label %.preheader42.lr.ph..preheader.lr.ph_crit_edge

.preheader42.lr.ph..preheader.lr.ph_crit_edge:    ; preds = %.preheader42.lr.ph
  %.pre = zext i32 %0 to i64
  br label %.preheader.lr.ph

.preheader42.us.preheader:                        ; preds = %.preheader42.lr.ph
  %11 = zext i32 %1 to i64
  %wide.trip.count79 = zext i32 %0 to i64
  br label %.preheader42.us

.preheader42.us:                                  ; preds = %._crit_edge52.us, %.preheader42.us.preheader
  %indvars.iv77 = phi i64 [ 0, %.preheader42.us.preheader ], [ %indvars.iv.next78, %._crit_edge52.us ]
  %12 = add i64 %indvars.iv77, %11
  %13 = trunc i64 %12 to i32
  br label %._crit_edge88

._crit_edge88:                                    ; preds = %._crit_edge88, %.preheader42.us
  %indvars.iv74 = phi i64 [ 0, %.preheader42.us ], [ %indvars.iv.next75, %._crit_edge88 ]
  %14 = add nuw nsw i64 %indvars.iv74, %indvars.iv77
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %10
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv77, i64 %indvars.iv74
  store double %18, double* %19, align 8
  %20 = trunc i64 %indvars.iv74 to i32
  %21 = sub i32 %13, %20
  %22 = srem i32 %21, 100
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %10
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv77, i64 %indvars.iv74
  store double %24, double* %25, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next75, %11
  br i1 %exitcond76, label %._crit_edge52.us, label %._crit_edge88

._crit_edge52.us:                                 ; preds = %._crit_edge88
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, %wide.trip.count79
  br i1 %exitcond80, label %.preheader.lr.ph.loopexit, label %.preheader42.us

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge52.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader42.lr.ph..preheader.lr.ph_crit_edge
  %wide.trip.count62.7.pre-phi = phi i64 [ %.pre, %.preheader42.lr.ph..preheader.lr.ph_crit_edge ], [ %wide.trip.count79, %.preheader.lr.ph.loopexit ]
  %26 = add i32 %0, 7
  %27 = add i32 %0, -2
  %28 = sext i32 %0 to i64
  %29 = trunc i32 %26 to i3
  %30 = add nsw i64 %wide.trip.count62.7.pre-phi, -8
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph46.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit64, %._crit_edge
  %exitcond = icmp eq i64 %indvars.iv.next72, %wide.trip.count62.7.pre-phi
  br i1 %exitcond, label %._crit_edge49.loopexit, label %.loopexit..lr.ph_crit_edge

.loopexit..lr.ph_crit_edge:                       ; preds = %.loopexit
  %indvars.iv.next87 = add i3 %indvars.iv86, -1
  %indvars.iv.next85 = add nuw i64 %indvars.iv84, 1
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %.loopexit..lr.ph_crit_edge, %.preheader.lr.ph
  %indvars.iv86 = phi i3 [ %29, %.preheader.lr.ph ], [ %indvars.iv.next87, %.loopexit..lr.ph_crit_edge ]
  %indvars.iv84 = phi i64 [ 2, %.preheader.lr.ph ], [ %indvars.iv.next85, %.loopexit..lr.ph_crit_edge ]
  %indvars.iv71 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next72, %.loopexit..lr.ph_crit_edge ]
  %indvars.iv69 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next70, %.loopexit..lr.ph_crit_edge ]
  %31 = zext i3 %indvars.iv86 to i64
  %32 = add nuw nsw i64 %31, 4294967295
  %33 = and i64 %32, 4294967295
  %34 = add i64 %indvars.iv84, %33
  %35 = sub nsw i64 0, %indvars.iv71
  %36 = trunc i64 %35 to i32
  %37 = add i32 %26, %36
  %38 = add i32 %27, %36
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %xtraiter82 = and i64 %indvars.iv.next72, 1
  %lcmp.mod = icmp eq i64 %xtraiter82, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %39 = trunc i64 %indvars.iv71 to i32
  %40 = srem i32 %39, 100
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %10
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 0
  store double %42, double* %43, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %44 = icmp eq i64 %indvars.iv71, 0
  br i1 %44, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %45 = add nuw nsw i64 %indvars.iv, %indvars.iv71
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 100
  %48 = sitofp i32 %47 to double
  %49 = fdiv double %48, %10
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv
  store double %49, double* %50, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %51 = add nuw nsw i64 %indvars.iv.next, %indvars.iv71
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, 100
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, %10
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next
  store double %55, double* %56, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv69
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %57 = icmp slt i64 %indvars.iv.next72, %28
  br i1 %57, label %.lr.ph46, label %.loopexit

.lr.ph46:                                         ; preds = %._crit_edge
  %xtraiter65 = and i32 %37, 7
  %lcmp.mod66 = icmp eq i32 %xtraiter65, 0
  br i1 %lcmp.mod66, label %.prol.loopexit64, label %.prol.preheader63.preheader

.prol.preheader63.preheader:                      ; preds = %.lr.ph46
  br label %.prol.preheader63

.prol.preheader63:                                ; preds = %.prol.preheader63.preheader, %.prol.preheader63..prol.preheader63_crit_edge
  %indvars.iv60.prol = phi i64 [ %indvars.iv.next61.prol, %.prol.preheader63..prol.preheader63_crit_edge ], [ %indvars.iv69, %.prol.preheader63.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader63..prol.preheader63_crit_edge ], [ %xtraiter65, %.prol.preheader63.preheader ]
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv60.prol
  store double -9.990000e+02, double* %58, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit64.loopexit, label %.prol.preheader63..prol.preheader63_crit_edge, !llvm.loop !1

.prol.preheader63..prol.preheader63_crit_edge:    ; preds = %.prol.preheader63
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  br label %.prol.preheader63

.prol.loopexit64.loopexit:                        ; preds = %.prol.preheader63
  br label %.prol.loopexit64

.prol.loopexit64:                                 ; preds = %.prol.loopexit64.loopexit, %.lr.ph46
  %indvars.iv60.unr = phi i64 [ %indvars.iv69, %.lr.ph46 ], [ %34, %.prol.loopexit64.loopexit ]
  %59 = icmp ult i32 %38, 7
  br i1 %59, label %.loopexit, label %.lr.ph46.new.preheader

.lr.ph46.new.preheader:                           ; preds = %.prol.loopexit64
  %60 = sub i64 %30, %indvars.iv60.unr
  %61 = lshr i64 %60, 3
  %62 = add nuw nsw i64 %61, 1
  %min.iters.check = icmp ult i64 %62, 2
  br i1 %min.iters.check, label %.lr.ph46.new.preheader89, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph46.new.preheader
  %n.mod.vf = and i64 %62, 1
  %n.vec = sub nsw i64 %62, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %63 = add i64 %indvars.iv60.unr, 8
  %64 = shl nuw i64 %61, 3
  %65 = add i64 %63, %64
  %66 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %65, %66
  br i1 %cmp.zero, label %.lr.ph46.new.preheader89, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %67 = shl i64 %index, 3
  %68 = add i64 %indvars.iv60.unr, %67
  %69 = add nsw i64 %68, 7
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %69
  %71 = getelementptr double, double* %70, i64 -7
  %72 = bitcast double* %71 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %72, align 8
  %index.next = add i64 %index, 2
  %73 = icmp eq i64 %index.next, %n.vec
  br i1 %73, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph46.new.preheader89

.lr.ph46.new.preheader89:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph46.new.preheader
  %indvars.iv60.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv60.unr, %min.iters.checked ], [ %indvars.iv60.unr, %.lr.ph46.new.preheader ]
  br label %.lr.ph46.new

.lr.ph46.new:                                     ; preds = %.lr.ph46.new.preheader89, %.lr.ph46.new
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.7, %.lr.ph46.new ], [ %indvars.iv60.ph, %.lr.ph46.new.preheader89 ]
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv60
  store double -9.990000e+02, double* %74, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61
  store double -9.990000e+02, double* %75, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.1
  store double -9.990000e+02, double* %76, align 8
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %77 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.2
  store double -9.990000e+02, double* %77, align 8
  %indvars.iv.next61.3 = add nsw i64 %indvars.iv60, 4
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.3
  store double -9.990000e+02, double* %78, align 8
  %indvars.iv.next61.4 = add nsw i64 %indvars.iv60, 5
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.4
  store double -9.990000e+02, double* %79, align 8
  %indvars.iv.next61.5 = add nsw i64 %indvars.iv60, 6
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.5
  store double -9.990000e+02, double* %80, align 8
  %indvars.iv.next61.6 = add nsw i64 %indvars.iv60, 7
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv71, i64 %indvars.iv.next61.6
  store double -9.990000e+02, double* %81, align 8
  %indvars.iv.next61.7 = add nsw i64 %indvars.iv60, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next61.7, %wide.trip.count62.7.pre-phi
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph46.new, !llvm.loop !6

._crit_edge49.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]* readonly, [1200 x double]* readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader44.us.preheader, label %._crit_edge55

.preheader44.us.preheader:                        ; preds = %7
  %wide.trip.count80 = zext i32 %1 to i64
  %wide.trip.count84 = zext i32 %0 to i64
  %10 = fmul double %2, 0.000000e+00
  %11 = add nsw i64 %wide.trip.count80, -1
  %min.iters.check = icmp ult i32 %1, 4
  %12 = and i32 %1, 3
  %n.mod.vf = zext i32 %12 to i64
  %n.vec = sub nsw i64 %wide.trip.count80, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert102 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat103 = shufflevector <2 x double> %broadcast.splatinsert102, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %10, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %12, 0
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %._crit_edge51.us, %.preheader44.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.preheader44.us.preheader ], [ %indvars.iv.next83, %._crit_edge51.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 0
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %wide.trip.count80
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 0
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %wide.trip.count80
  %13 = icmp sgt i64 %indvars.iv82, 0
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv82
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us56.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

.preheader.us56.preheader:                        ; preds = %.preheader44.us
  br i1 %min.iters.check, label %.preheader.us56.preheader110, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us56.preheader
  br i1 %cmp.zero, label %.preheader.us56.preheader110, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %scevgep92, %scevgep90
  %found.conflict = and i1 %bound0, %bound1
  %bound097 = icmp ult double* %scevgep, %14
  %bound198 = icmp ult double* %14, %scevgep90
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx = or i1 %found.conflict, %found.conflict99
  br i1 %conflict.rdx, label %.preheader.us56.preheader110, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %index
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !8, !noalias !11
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !8, !noalias !11
  %19 = fmul <2 x double> %wide.load, %broadcast.splat103
  %20 = fmul <2 x double> %wide.load101, %broadcast.splat103
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %index
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !14
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !14
  %25 = fmul <2 x double> %wide.load104, %broadcast.splat107
  %26 = fmul <2 x double> %wide.load105, %broadcast.splat107
  %27 = load double, double* %14, align 8, !alias.scope !15
  %28 = insertelement <2 x double> undef, double %27, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = insertelement <2 x double> undef, double %27, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = fmul <2 x double> %25, %29
  %33 = fmul <2 x double> %26, %31
  %34 = fadd <2 x double> %19, %32
  %35 = fadd <2 x double> %20, %33
  %36 = fadd <2 x double> %broadcast.splat109, %34
  %37 = fadd <2 x double> %broadcast.splat109, %35
  %38 = bitcast double* %15 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8, !alias.scope !8, !noalias !11
  %39 = bitcast double* %17 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge51.us, label %.preheader.us56.preheader110

.preheader.us56.preheader110:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us56.preheader
  %indvars.iv.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us56.preheader ]
  %41 = sub nsw i64 %wide.trip.count80, %indvars.iv.ph
  %xtraiter = and i64 %41, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us56.prol.loopexit.unr-lcssa, label %.preheader.us56.prol.preheader

.preheader.us56.prol.preheader:                   ; preds = %.preheader.us56.preheader110
  br label %.preheader.us56.prol

.preheader.us56.prol:                             ; preds = %.preheader.us56.prol.preheader
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.ph
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %3
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.ph
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %2
  %48 = load double, double* %14, align 8
  %49 = fmul double %47, %48
  %50 = fadd double %44, %49
  %51 = fadd double %10, %50
  store double %51, double* %42, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %.preheader.us56.prol.loopexit.unr-lcssa

.preheader.us56.prol.loopexit.unr-lcssa:          ; preds = %.preheader.us56.preheader110, %.preheader.us56.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.preheader.us56.prol ], [ %indvars.iv.ph, %.preheader.us56.preheader110 ]
  br label %.preheader.us56.prol.loopexit

.preheader.us56.prol.loopexit:                    ; preds = %.preheader.us56.prol.loopexit.unr-lcssa
  %52 = icmp eq i64 %11, %indvars.iv.ph
  br i1 %52, label %._crit_edge51.us.loopexit111, label %.preheader.us56.preheader110.new

.preheader.us56.preheader110.new:                 ; preds = %.preheader.us56.prol.loopexit
  br label %.preheader.us56

.preheader.us56:                                  ; preds = %.preheader.us56, %.preheader.us56.preheader110.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us56.preheader110.new ], [ %indvars.iv.next.1, %.preheader.us56 ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %14, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %55, %60
  %62 = fadd double %10, %61
  store double %62, double* %53, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %14, align 8
  %70 = fmul double %68, %69
  %71 = fadd double %65, %70
  %72 = fadd double %10, %71
  store double %72, double* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count80
  br i1 %exitcond.1, label %._crit_edge51.us.loopexit111.unr-lcssa, label %.preheader.us56, !llvm.loop !17

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit111.unr-lcssa:           ; preds = %.preheader.us56
  br label %._crit_edge51.us.loopexit111

._crit_edge51.us.loopexit111:                     ; preds = %.preheader.us56.prol.loopexit, %._crit_edge51.us.loopexit111.unr-lcssa
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit111, %._crit_edge51.us.loopexit, %middle.block
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %._crit_edge55.loopexit, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  br label %._crit_edge

._crit_edge.us.us:                                ; preds = %._crit_edge
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78
  %75 = load double, double* %74, align 8
  %76 = fmul double %75, %3
  %77 = load double, double* %73, align 8
  %78 = fmul double %77, %2
  %79 = load double, double* %14, align 8
  %80 = fmul double %78, %79
  %81 = fadd double %76, %80
  %82 = fmul double %96, %2
  %83 = fadd double %82, %81
  store double %83, double* %74, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %._crit_edge51.us.loopexit, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv72 = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next73, %._crit_edge ]
  %.047.us.us = phi double [ 0.000000e+00, %.preheader.us.us ], [ %96, %._crit_edge ]
  %84 = load double, double* %73, align 8
  %85 = fmul double %84, %2
  %86 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv72
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv78
  %90 = load double, double* %89, align 8
  %91 = fadd double %90, %88
  store double %91, double* %89, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv72, i64 %indvars.iv78
  %93 = load double, double* %92, align 8
  %94 = load double, double* %86, align 8
  %95 = fmul double %93, %94
  %96 = fadd double %.047.us.us, %95
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv82
  br i1 %exitcond77, label %._crit_edge.us.us, label %._crit_edge

._crit_edge55.loopexit:                           ; preds = %._crit_edge51.us
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv16, %10
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
